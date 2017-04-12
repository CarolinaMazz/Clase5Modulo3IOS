//
//  WebViewController.swift
//  Multimedia en IOS
//
//  Created by alumno on 11/04/17.
//  Copyright © 2017 william. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //url remote
        //let url = URL(string: "http://www.google.com")
        //let request = URLRequest(url: url!)
        //webView.loadRequest(request)
        
        //html
        let htmlString = "<h1>HOLA</h1>"
        webView.loadHTMLString(htmlString, baseURL: nil)
        
        //html local
        let path = Bundle.main.path(forResource: "hola.html", ofType: nil)
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
