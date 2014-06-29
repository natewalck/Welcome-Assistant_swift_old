//
//  customImageViewController.swift
//  Welcome Assistant
//
//  Created by Nate Walck on 6/29/14.
//  Copyright (c) 2014 OS X Devops. All rights reserved.
//

import Cocoa

class customImageViewController: NSViewController {

    @IBOutlet var setImageViewTitle : NSTextField
    @IBOutlet var setImageView : NSImageView

    var imageTitle: String? = nil
    var imageViewPath: String? = nil

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?,
        imageTitle: String?, imageViewPath: String?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.imageTitle = imageTitle
        self.imageViewPath = imageViewPath
    }
    
    override func loadView()  {
        super.loadView()
        setImageViewTitle.setStringValue(imageTitle)
        setImageView.setImage(NSImage(contentsOfFile: imageViewPath))
    }
    
}