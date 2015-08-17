//
//  BrowserViewController.swift
//  intern-sample
//
//  Created by sakahara on 2015/08/14.
//  Copyright (c) 2015年 Sonicmoov. All rights reserved.
//

import UIKit

class BrowserViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var URL: NSURL?

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadRequest(NSURLRequest(URL: URL!));
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
