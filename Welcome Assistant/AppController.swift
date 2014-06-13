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
    
    @IBOutlet var window : NSWindow
    
    @IBOutlet var myCustomView : NSView = nil
    @IBOutlet var myViewController : NSViewController = NSViewController()
        
    // [ken] had to change the names of your properties because the class and the var had the same name. Classes should start with uppercase.
    var custWebViewController: NSViewController = customWebViewController(nibName: "customWebViewController", bundle: nil)
    var custInfoViewController: NSViewController = customInfoViewController(nibName: "customInfoViewController", bundle: nil)
    var theWelcomeScreenController: NSViewController = welcomeScreenController(nibName: "welcomeScreenController", bundle: nil, welcomeTitle: "Welcome to OS X Devops", welcomeImagePath: "/tmp/watowl.jpg")

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
    
    func pageController(button: String) -> (NSViewController, NSViewController) {
        let pageList: NSViewController[] = [theWelcomeScreenController,custInfoViewController,custWebViewController, custInfoViewController, custWebViewController, custInfoViewController]
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

//        if currentPage == nil {
//            currentPage = 0
//            println("Current page initialized as \(currentPage)")
//        }
        

 
        
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        println("Next Page \(nextPage)")
//        println("Current Page \(currentPage)")
        println("Previous Page \(previousPage)")
    }

}