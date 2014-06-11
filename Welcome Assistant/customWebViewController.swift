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
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Initialization code here.
    }
    
}
