//
//  customInfoViewController.swift
//  Welcome Assistant
//
//  Created by Nate Walck on 6/8/14.
//  Copyright (c) 2014 OS X Devops. All rights reserved.
//

import Cocoa

class customInfoViewController: NSViewController {
    
    @IBOutlet var setInfoViewtitle : NSTextField
    @IBOutlet var setInfoViewBody : NSTextField
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Initialization code here.
    }
    
    override func loadView()  {
        super.loadView()
        setInfoViewtitle.setStringValue("test 123")
    }
}