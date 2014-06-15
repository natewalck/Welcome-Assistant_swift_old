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
    @IBOutlet var welcomeScreenImage : NSImageView
    @IBOutlet var welcomeScreenBody : NSTextField
    
    var welcomeTitle: String? = nil
    var welcomeImagePath: String? = nil
    var welcomeBody: String? = nil
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, welcomeTitle: String?, welcomeBody: String?, welcomeImagePath: String?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.welcomeImagePath = welcomeImagePath
        self.welcomeTitle = welcomeTitle
        self.welcomeBody = welcomeBody
    }

    override func loadView()  {
        super.loadView()
        welcomeScreenTitle.setStringValue(welcomeTitle)
        welcomeScreenBody.setStringValue(welcomeBody)
        welcomeScreenImage.setImage(NSImage(contentsOfFile: welcomeImagePath))
    }

}