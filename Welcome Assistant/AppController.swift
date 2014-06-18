//
//  AppController.swift
//  Welcome Assistant
//
//  Created by Nate Walck on 6/8/14.
//  Copyright (c) 2014 OS X Devops. All rights reserved.
//

import Cocoa
import Foundation

class AppController: NSObject {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var window : NSWindow
    
    @IBOutlet var myCustomView : NSView = nil
    @IBOutlet var myViewController : NSViewController = NSViewController()

    @IBOutlet var continueButtonControl : NSButton
    @IBOutlet var backButtonControl : NSButton
    
    var theWelcomeView: NSViewController!
    
    var currentViewController: NSViewController? = nil
    
    var standardUserDefaults: NSUserDefaults = NSUserDefaults()
    
    var lastPage: Int!
    var firstPage: Int!
    var currentPage: Int = 0
    var nextPage: Int = 0
    var previousPage: Int = 0
    
    var welcomeScreenTextValue: String?
    var pageList: NSViewController[] = []
    var prefPageList: AnyObject? = nil
    var welcomePrefs: AnyObject? = nil

    
    var nextPageController: NSViewController? = nil
    var previousPageController: NSViewController? = nil
    
    let currentWorkspace: NSWorkspace = NSWorkspace.sharedWorkspace()


    @IBAction func continueButton(sender : AnyObject) {
        println("Continue Button clicked")
        var (previous, next) = pageController("continue")
        currentViewController = changeViewController(next)
    }

    @IBAction func backButton(sender : AnyObject) {
        println("Back Button clicked")
        var (previous, next) = pageController("back")
        currentViewController = changeViewController(previous)
    }

    func changeViewController(viewName:NSViewController) -> NSViewController {
        var allSubViews: NSArray = myCustomView.subviews()
        for subView in allSubViews {
            subView.removeFromSuperview()
        }
//        currentViewController?.view().removeFromSuperview()
        currentViewController = viewName
        myCustomView.addSubview(viewName.view())
        viewName.view().setFrame(myCustomView.bounds())
//        println(currentViewController.description)
        return currentViewController!
    }
    
    func setupViewController(type: String, title: String, content: String, image: String?) -> NSViewController {
        var returnViewController: NSViewController!
        switch type {
            case "info":
//                println("Info View")
                returnViewController = customInfoViewController(nibName: "customInfoViewController", bundle: nil, infoTitle: title, infoBody: content)
            case "weburl":
//                println("Web View")
                returnViewController = customWebViewController(nibName: "customWebViewController", bundle: nil, webTitle: title, webUrl: content)
            default:
//                println("Info View")
                returnViewController = customInfoViewController(nibName: "customInfoViewController", bundle: nil, infoTitle: title, infoBody: content)
        }

        return returnViewController
    }
    
//    func setupAllViews(pagesToSetup: Array<Dictionary<String, String>>) -> NSViewController[] {
    func setupAllViews(pagesToSetup: Array<AnyObject>) -> NSViewController[] {
        var viewControllerList: NSViewController[] = []
        for item in pagesToSetup {
            var pageType = item["PageType"] as String
            var titleValue = item["Title"] as String
            var bodyValue = item["Body"] as String
            viewControllerList += setupViewController(pageType, title: titleValue, content: bodyValue, image: nil)
        }
        return viewControllerList
    }
    
    func pageController(button: String) -> (NSViewController, NSViewController) {
        println(pageList.count)
        println("Next Page \(nextPage)")
        println("Previous Page \(previousPage)")
        if lastPage == nil {
            lastPage = pageList.count - 1
        }
        
        if firstPage == nil {
            firstPage = pageList.startIndex
        }

        
        if currentPage + 1 > lastPage {
            nextPage = lastPage
        } else {
            nextPage = currentPage + 1
        }
        
        if currentPage - 1 < firstPage {
            previousPage = firstPage
        } else {
            previousPage = currentPage - 1
        }

        if button == "continue" {
            if currentPage + 1 > lastPage {
            } else {
                currentPage = currentPage + 1
            }
        } else if button == "back" {
            if currentPage - 1 < firstPage {
            } else {
                currentPage = currentPage - 1
            }
        }
        
        if currentPage == lastPage {
            continueButtonControl.setEnabled(false)
        } else {
            continueButtonControl.setEnabled(true)
        }
        
        if currentPage == firstPage {
            backButtonControl.setEnabled(false)
        } else {
            backButtonControl.setEnabled(true)
        }
      
        println("Next Page \(nextPage)")
        println("Previous Page \(previousPage)")
        
        return (pageList[previousPage], pageList[nextPage])
    }
    
    func loadPreferences() {
        userDefaults.synchronize()
        var defaultPrefsFile = NSBundle.mainBundle().pathForResource("defaultPrefs", ofType: "plist")
        println(defaultPrefsFile)
        var defaultPreferences = NSDictionary.dictionaryWithContentsOfFile(defaultPrefsFile) as NSDictionary
        userDefaults.synchronize()
        println(defaultPreferences)
        userDefaults.registerDefaults(defaultPreferences as NSDictionary)
//        welcomeScreenTextValue = userDefaults.stringForKey("WelcomeTitle")
        prefPageList = userDefaults.objectForKey("AssistantPages")
        welcomePrefs = userDefaults.objectForKey("WelcomePage")

    }

    func setupWelcomeView(pageToSetup: Array<AnyObject>) -> NSViewController  {
        var item = pageToSetup[0]
        var titleValue = item["Title"] as String
        var imagePath = item["Image"] as String
        var bodyValue = item["Body"] as String
        if titleValue == "" {
            println("no worky")
        }
        var returnView = welcomeScreenController(nibName: "welcomeScreenController", bundle: nil, welcomeTitle: titleValue, welcomeBody: bodyValue, welcomeImagePath: imagePath)
        
        return returnView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Disable backButton intitially
        backButtonControl.setEnabled(false)
        loadPreferences()
        theWelcomeView = setupWelcomeView(welcomePrefs as NSArray)
        changeViewController(theWelcomeView)
        pageList += theWelcomeView
        pageList += setupAllViews(prefPageList as NSArray)
        println(pageList.count)

//        println("Next Page \(nextPage)")
//        println("Current Page \(currentPage)")
//        println("Previous Page \(previousPage)")
    }

}