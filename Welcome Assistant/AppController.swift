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
    
    // [ken] had to change the names of your properties because the class and the var had the same name. Classes should start with uppercase.
    var custWebViewController: NSViewController = customWebViewController(nibName: "customWebViewController", bundle: nil)
    var custInfoViewController: NSViewController = customInfoViewController(nibName: "customInfoViewController", bundle: nil)
    var theWelcomeScreenController: NSViewController = welcomeScreenController(nibName: "welcomeScreenController", bundle: nil)

    var currentViewController: NSViewController? = nil
    
    var standardUserDefaults: NSUserDefaults = NSUserDefaults()
    
    let currentWorkspace: NSWorkspace = NSWorkspace.sharedWorkspace()

    @IBAction func backButton(sender : AnyObject) {
        println("Back Button clicked")
        currentViewController = changeViewController(custInfoViewController)
        
    }
    
    
    @IBAction func continueButton(sender : AnyObject) {
        println("Continue Button clicked")
        currentViewController = changeViewController(custWebViewController)
    }
    
    func changeViewController(viewName:NSViewController) -> NSViewController {
        var allSubViews: NSArray = myCustomView.subviews()
        for subView in allSubViews {
            subView.removeFromSuperview()
        }
        currentViewController?.view().removeFromSuperview()
        currentViewController = viewName
        myCustomView.addSubview(viewName.view())
        viewName.view().setFrame(myCustomView.bounds())
        return currentViewController!
    }

}