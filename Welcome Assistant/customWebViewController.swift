//
//  customWebViewController.swift
//  Welcome Assistant
//
//  Created by Nate Walck on 6/8/14.
//  Copyright (c) 2014 OS X Devops. All rights reserved.
//

import Cocoa
import WebKit

class customWebViewController: NSViewController {

    @IBOutlet var webViewContent : WebView
    @IBOutlet var webViewTitle : NSTextField
    
    var webTitleString: String? = nil
    var webUrlString: String? = nil
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?,
        webTitle: String?, webUrl: String?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.webTitleString = webTitle
        self.webUrlString = webUrl
        // Initialization code here.
    }
    
    override func loadView()  {
        super.loadView()
        self.webViewTitle.setStringValue(webTitleString)
        self.webViewContent.setMainFrameURL(webUrlString)
    }
}