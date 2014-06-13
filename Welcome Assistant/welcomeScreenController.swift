//
//  welcomeScreenController.swift
//  Welcome Assistant
//
//  Created by Nate Walck on 6/10/14.
//  Copyright (c) 2014 OS X Devops. All rights reserved.
//

import Cocoa

class welcomeScreenController: NSViewController {

    @IBOutlet var welcomeScreenTitle : NSTextField
    var welcomeTitle: String? = "Welcome to Some Compan"
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, welcomeTitle: String?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.welcomeTitle = welcomeTitle
        // Initialization code here.
    }

    override func loadView()  {
        super.loadView()
        welcomeScreenTitle.setStringValue(welcomeTitle)
    }
    
}
