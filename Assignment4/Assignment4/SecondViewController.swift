//
//  SecondViewController.swift
//  Assignment4
//
//  Created by DONG JIANG on 10/21/16.
//  Copyright © 2016 DONG JIANG. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var urlStr:String = "http://www.google.com"
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var urlText: UITextField!
    
    @IBAction func goButton() {
        
        hideKeyboard()

        if let urltxt = urlText.text{
            urlStr = urltxt
        }
        else{
            return
        }
        print (urlStr)
        
        if let theURL = URL(string:urlStr){
            let theURLRequest = URLRequest(url:theURL)
            webView.loadRequest(theURLRequest)
        }
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let theURL = URL(string:urlStr){
           let theURLRequest = URLRequest(url:theURL)
            webView.loadRequest(theURLRequest)
            urlText.text = "http://"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

