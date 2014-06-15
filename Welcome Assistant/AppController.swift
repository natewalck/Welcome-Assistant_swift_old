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
        
    // [ken] had to change the names of your properties because the class and the var had the same name. Classes should start with uppercase.
    var custWebViewController: NSViewController = customWebViewController(nibName: "customWebViewController", bundle: nil,
                                                                          webTitle: "Setup Google 2FA", webUrl: "http://www.google.com")
    
    var custInfoViewController: NSViewController = customInfoViewController(nibName: "customInfoViewController", bundle: nil,
                                                                            infoTitle: "omg", infoBody: "Please work")

    var theWelcomeScreenController: NSViewController = welcomeScreenController(nibName: "welcomeScreenController", bundle: nil,
                                                                               welcomeTitle: "Welcome to OS X Devops", welcomeBody: "lolwat", welcomeImagePath: "/tmp/watowl.jpg")

//    var pageList: NSViewController[] = [theWelcomeScreenController,custInfoViewController,custWebViewController]
//    var lastPage = pageList.count - 1
//    var firstPage = pageList.startIndex
    
    var currentViewController: NSViewController? = nil
    
    var standardUserDefaults: NSUserDefaults = NSUserDefaults()
    
    var lastPage: Int!
    var firstPage: Int!
    var currentPage: Int = 0
    var nextPage: Int = 0
    var previousPage: Int = 0
    
    var welcomeScreenTextValue: String?
    var pageList: NSViewController[] = []
    var prefPageList = []
    
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
    
    func setupViewController(type: String, title: String, content: String) -> NSViewController {
        var returnViewController: NSViewController!
        switch type {
            case "info":
                println("Info View")
                returnViewController = customInfoViewController(nibName: "customInfoViewController", bundle: nil, infoTitle: title, infoBody: content)
            case "weburl":
                println("Web View")
                returnViewController = customWebViewController(nibName: "customWebViewController", bundle: nil, webTitle: title, webUrl: content)
            default:
                println("Info View")
                returnViewController = customInfoViewController(nibName: "customInfoViewController", bundle: nil, infoTitle: title, infoBody: content)
        }

        return returnViewController
    }
    
//    func setupAllViews(pagesToSetup: Array<Dictionary<String, String>>) -> NSViewController[] {
    func setupAllViews(pagesToSetup: Array<Dictionary<String, String>>) {
        var viewControllerList: NSViewController[] = []
        for item in pagesToSetup {
            println(item["PageType"])
//            viewControllerList += setupViewController(item["PageType"], title: item["Title"], content: item["Body"])
        }
//        return viewControllerList
    }
    
    func pageController(button: String) -> (NSViewController, NSViewController) {
//        let pageList: NSViewController[] = [theWelcomeScreenController,custInfoViewController,custWebViewController, custInfoViewController, custWebViewController, custInfoViewController]
        println("Next Page \(nextPage)")
//        println("Current Page \(currentPage)")
        println("Previous Page \(previousPage)")
        if lastPage == nil {
//            println("Last Page is not configured, setting it up")
            lastPage = pageList.count - 1
//            println("Last Page = \(lastPage)")
        }
        
        if firstPage == nil {
//            println("First Page is not configured, setting it up")
            firstPage = pageList.startIndex
//            println("First Page = \(firstPage)")
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
      
        println("Next Page \(nextPage)")
//        println("Current Page \(currentPage)")
        println("Previous Page \(previousPage)")
        
        return (pageList[previousPage], pageList[nextPage])
    }
    
    func loadPreferences() {
        userDefaults.synchronize()
        welcomeScreenTextValue = userDefaults.stringForKey("WelcomeTitle")
        prefPageList = userDefaults.arrayForKey("AssistantPages")
//         Print all preferences
                for item in prefPageList {
                    println(item)
                    println(item["PageType"].value)
            }
//
//                println(welcomeScreenTextValue)
    }
    
    func makePrefsNative(prefs: NSDictionary) -> Dictionary<String, String> {
        var tempPref = ["something": "else"]
        tempPref["PageType"] = prefs["PageType"].value
        tempPref["Title"] = prefs["Title"].value
        tempPref["Body"] = prefs["Body"].value
        
        return tempPref
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadPreferences()
//        setupAllViews(prefPageList)

//        println("Next Page \(nextPage)")
//        println("Current Page \(currentPage)")
//        println("Previous Page \(previousPage)")
    }

}