//
//  ViewController.swift
//  test
//
//  Created by DONG JIANG on 11/9/16.
//  Copyright © 2016 DONG JIANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var listData: Array<String>?
    @IBOutlet weak var tableView: UITableView!

    func fetchData(){
        if let url = URL(string: "http://bismarck.sdsu.edu/rateme/list") {
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: getWebPage)
            task.resume()
        }
        else {
            print("Unable to create URL")
        }
    }
    
    func getWebPage(data:Data?, response:URLResponse?, error:Error?) -> Void {
        guard error == nil else {
            print("error: \(error!.localizedDescription)")
            return
        }

        let httpResponse = response as? HTTPURLResponse
        let status:Int = httpResponse!.statusCode

        if data != nil && (status == 200) {
            do {
                let json:Any = try JSONSerialization.jsonObject(with: data!)
                listData = []
                for dic in json as! [[String:AnyObject]]{
                let tempStr = String(describing: dic["firstName"]!)+" "+String(describing:dic["lastName"]!)
                    listData?.append(tempStr)
                }
                performSelector(onMainThread: #selector(self.reloadProfView),
                                with: nil,
                                waitUntilDone: false)
                
            } catch {
              }
        }
    }
    //used to update data
    func reloadProfView(){
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fetchData()
        
        self.title = "Professor List"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cnt = listData?.count{
            return cnt
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                var cell = tableView.dequeueReusableCell(withIdentifier: "1", for: indexPath)
                if (cell == nil ) {
                    cell = UITableViewCell(style: .default, reuseIdentifier: "1") as! TableViewCell
                }
                cell.textLabel!.text = listData![indexPath.row]
                return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showView")
        {
            let upcoming:detailViewController = segue.destination as! detailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            upcoming.id = (indexPath?.row)! + 1
            self.tableView.deselectRow(at: indexPath!, animated: true)
        }
        
    }
}

