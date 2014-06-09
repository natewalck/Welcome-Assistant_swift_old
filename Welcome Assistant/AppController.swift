//
//  AppController.swift
//  Welcome Assistant
//
//  Created by Nate Walck on 6/8/14.
//  Copyright (c) 2014 OS X Devops. All rights reserved.
//

import Cocoa
import Foundation

class AppController: NSObject {

    @IBOutlet var window : NSWindow
    
    @IBOutlet var myCustomView : NSView = nil
    @IBOutlet var myViewController : NSViewController = NSViewController()
    
//    @IBOutlet var infoViewTitle: NSTextField = NSTextField()
    
    var customWebViewController: NSViewController = NSViewController(nibName: "customWebViewController", bundle: nil)
    var customInfoViewController: NSViewController = NSViewController(nibName: "customInfoViewController", bundle: nil)
    
    var currentViewController: NSViewController? = nil
    
    let currentWorkspace: NSWorkspace = NSWorkspace.sharedWorkspace()
    
    @IBAction func backButton(sender : AnyObject) {
        println("Back Button clicked")
        currentViewController?.view.removeFromSuperview()
        currentViewController = customInfoViewController
        myCustomView.addSubview(customInfoViewController.view)
    }
    
    
    @IBAction func continueButton(sender : AnyObject) {
        println("Continue Button clicked")
        currentViewController?.view.removeFromSuperview()
        currentViewController = customWebViewController
        myCustomView.addSubview(customWebViewController.view)
    }
    
}