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
    
//    var myWelcomeScreenController: NSViewController!


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        NSApp.activateIgnoringOtherApps(true)
        var fixedSize = window.frame().size
        window.setMinSize(fixedSize)
        window.setMaxSize(fixedSize)
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }

}