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

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Initialization code here.
    }

    override func loadView()  {
        super.loadView()
        welcomeScreenTitle.setStringValue("Welcome to SomeCompany")
    }
    
}
