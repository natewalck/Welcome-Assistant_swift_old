//
//  customEulaController.swift
//  Welcome Assistant
//
//  Created by Nate Walck on 6/29/14.
//  Copyright (c) 2014 OS X Devops. All rights reserved.
//

import Cocoa

class customEulaController: NSViewController {

    @IBOutlet var setEulaTitle : NSTextField
    @IBOutlet var setEulaBody : NSTextField
    @IBOutlet var eulaCheckbox : NSButton
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Initialization code here.
    }
    
    @IBAction func eulaCheckboxAction (sender : AnyObject) {
        println("Eula Button clicked")
    }

}