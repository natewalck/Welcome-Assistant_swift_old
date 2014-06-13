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
    
    var theWelcomeScreenController: NSViewController = welcomeScreenController(nibName: "welcomeScreenController", bundle: nil, welcomeTitle: "LOLWAT")

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        NSApp.activateIgnoringOtherApps(true)
        myCustomView.addSubview(theWelcomeScreenController.view())
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }

}