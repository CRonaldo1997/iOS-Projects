//
//  detailViewController.swift
//  test
//
//  Created by DONG JIANG on 11/9/16.
//  Copyright © 2016 DONG JIANG. All rights reserved.
//

import UIKit

class detailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var commentList: Array<String>?
    var id: Int?
    var url4Faculty = "http://bismarck.sdsu.edu/rateme/instructor/"
    var url4Comments = "http://bismarck.sdsu.edu/rateme/comments/"
    var postRatingUrl = "http://bismarck.sdsu.edu/rateme/rating/"
    var postCommentUrl = "http://bismarck.sdsu.edu/rateme/comment/"
    var ratingAsData: Data?
    var mycomment : Data?
    var jsonRate : Data?
    var alertStr : String?
    
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var yourRate: UILabel!
    @IBAction func minus() {
        if Int(yourRate.text!)!>=2{
            yourRate.text = String((Int(yourRate.text!)!-1))
        }
    }
    
    @IBAction func plus() {
        if Int(yourRate.text!)!<=4{
            yourRate.text = String((Int(yourRate.text!)!+1))
        }
        
    }
    
    @IBOutlet weak var comment: UITextField!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var office: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var rating: UILabel!
  
    @IBAction func submitButton() {
        hideKeyboard()
        
        //Alert here
        if comment.text!.isEmpty == true{
            alertStr = "Rating "+yourRate.text!+" submitted without comment"
        }else{
            alertStr = "Rating "+yourRate.text!+" and comment are submitted"
        }
        let controller = UIAlertController(title: " ",message: alertStr,preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler:{action in print("in OK")})
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: {print("Done")})
        
        //Post rating and comment here
        if comment.text!.isEmpty == false{

            commentList?.insert(comment.text!, at: 0)
            commentTableView.reloadData()
            
            //post comments
            if let url = URL(string: postCommentUrl+String(describing: id!)){
                if let commentStr = comment.text{
                    mycomment = commentStr.data(using:.utf8)
                    
                }else{
                    print("No comments")
                }
                
                var mutableRequest = URLRequest.init(url: url)
                mutableRequest.httpMethod = "POST"
                mutableRequest.setValue("text/plain",
                                        forHTTPHeaderField: "Content-Type")
                let session = URLSession.shared
                let task = session.uploadTask(with: mutableRequest,
                                              from: mycomment,
                                              completionHandler: uploadResponse)
                task.resume()
            }
            else {
                print("Unable to create URL")
            }
        }
        
    // post rating
        if let url = URL(string: postRatingUrl+String(describing: id!)+"/"+yourRate.text!){
            if let rateStr = yourRate.text{
                jsonRate = rateStr.data(using:.utf8)
            }else{
                print("No comments")
            }

            var mutableRequest = URLRequest.init(url: url)
            mutableRequest.httpMethod = "POST"
            mutableRequest.setValue("text/plain",
                                    forHTTPHeaderField: "Content-Type")
            let session = URLSession.shared
            let task = session.uploadTask(with: mutableRequest,
                                          from: jsonRate,
                                          completionHandler: uploadResponse)
            task.resume()
        }
        else {
            print("Unable to create URL")
        }
    }
    
    func uploadResponse(data:Data?, response:URLResponse?, error:Error?) -> Void {
        guard error == nil else {
            return
        }
        let httpResponse = response as? HTTPURLResponse
        let status:Int = httpResponse!.statusCode
        if status != 200,
            let error = String(data: data!, encoding: String.Encoding.utf8){
            return
        }
    }
    
    //Fetch data
    func fetchJasonInfo(){
        if let url = URL(string: url4Faculty+String(describing: id!)) {
//            print(url)
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: getWebPage_1)
            task.resume()
        }
        else {
            print("Unable to create URL")
        }
    }
    
    func getWebPage_1(data:Data?, response:URLResponse?, error:Error?) -> Void {
        guard error == nil else {
            print("error: \(error!.localizedDescription)")
            return
        }

        let httpResponse = response as? HTTPURLResponse
        let status:Int = httpResponse!.statusCode
        
        if data != nil && (status == 200) {
            do {
                let json:Any = try JSONSerialization.jsonObject(with: data!)
                let jsonDictionary = json as! NSDictionary
                performSelector(onMainThread: #selector(self.setText(jsonDictionary:)),
                                with: jsonDictionary,
                                waitUntilDone: false)
            } catch {
                print("error")
            }
        }
    }
    
    //set text
    func setText(jsonDictionary: NSDictionary){
                        firstName.text = (jsonDictionary["firstName"] as! String)
                        lastName.text = (jsonDictionary["lastName"] as! String)
                        office.text = (jsonDictionary["office"] as! String)
                        phone.text = (jsonDictionary["phone"] as! String)
                        email.text = (jsonDictionary["email"] as! String)
                        let tempDic:Dictionary<String,Float> = (jsonDictionary["rating"] as! Dictionary)
                        rating.text = String(describing: tempDic["average"]!)
    }
    
    //fetch comments
    func fetchJasonComments(){
        if let url = URL(string: url4Comments+String(describing: id!)) {
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: getComments)
            task.resume()
        }
        else {
            print("Unable to create URL")
        }
    }
    
    
    func getComments(data:Data?, response:URLResponse?, error:Error?) -> Void {
        guard error == nil else {
        print("error: \(error!.localizedDescription)")
        return
        }
    
        let httpResponse = response as? HTTPURLResponse
        let status:Int = httpResponse!.statusCode

        if data != nil && (status == 200) {
            
            do {
                let json:Any = try JSONSerialization.jsonObject(with: data!)
                commentList = []
                for dic in json as! [[String:AnyObject]]{
                    let tempString = dic["text"] as! String
                    commentList?.append(tempString)
                }
                
                performSelector(onMainThread: #selector(self.reloadView),
                                with: nil,
                                waitUntilDone: false)
            } catch {
                print("json error: \(error.localizedDescription)")
            }
        }
    }
    func reloadView(){
        commentTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJasonInfo()
        fetchJasonComments()
        self.title = "Details"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //commentTableView
    func numberOfSections(in commentTableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ commentTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cnt_1 = commentList?.count{
            return cnt_1
        }else{
            return 0
        }
    }
    
    func tableView(_ commentTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell_1 = commentTableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        if (cell_1 == nil ) {
            cell_1 = UITableViewCell(style: .default, reuseIdentifier: "commentCell") as! commentTableViewCell
        }
        cell_1.textLabel!.text = commentList![indexPath.row]
        return cell_1
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
