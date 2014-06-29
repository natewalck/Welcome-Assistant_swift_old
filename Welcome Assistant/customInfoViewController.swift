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
    
    var infoViewTitleText: String? = "1Password Setup"
    var infoViewBodyText: String? = "1. Open 1Password.app\n2. Set it up\n3. Celebrate"
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, infoTitle: String?, infoBody: String?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.infoViewTitleText = infoTitle
        self.infoViewBodyText = infoBody
    }
    
    override func loadView()  {
        super.loadView()
        setInfoViewtitle.setStringValue(infoViewTitleText)
        setInfoViewBody.setStringValue(infoViewBodyText)
    }
}