//
//  AppDelegate.swift
//  Welcome Assistant
//
//  Created by Nate Walck on 6/8/14.
//  Copyright (c) 2014 OS X Devops. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow
    @IBOutlet var myCustomView : NSView = nil
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var myWelcomeScreenController: NSViewController!

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        NSApp.activateIgnoringOtherApps(true)
        var theWelcomeScreenControllerObject = loadWelcomeScreenController()
        myCustomView.addSubview(theWelcomeScreenControllerObject.view())
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }
    
    func welcomeScreenTextValue() -> String? {
        userDefaults.synchronize()
        var returnValue = "Example Company"
        if let welcomeScreenTextValue = userDefaults.stringForKey("WelcomeTitle") {
            returnValue = welcomeScreenTextValue
        }
        return returnValue
    }

    func welcomeScreenBodyValue() -> String? {
        userDefaults.synchronize()
        var returnValue = "We know you will like it here!"
        if let welcomeScreenBodyValue = userDefaults.stringForKey("WelcomeBody") {
            returnValue = welcomeScreenBodyValue
        }
        return returnValue
    }
    
    func welcomeScreenImagePath() -> String? {
        userDefaults.synchronize()
        var returnPathValue = "/tmp/watowl.jpg"
        if let welcomeScreenImagePath = userDefaults.stringForKey("WelcomeImage") {
            returnPathValue = welcomeScreenImagePath
        }
        return returnPathValue
    }
    
    func loadWelcomeScreenController() -> NSViewController! {
        myWelcomeScreenController = welcomeScreenController(nibName: "welcomeScreenController", bundle: nil, welcomeTitle: welcomeScreenTextValue(), welcomeBody: welcomeScreenBodyValue(), welcomeImagePath: welcomeScreenImagePath())
        return myWelcomeScreenController
    }

}