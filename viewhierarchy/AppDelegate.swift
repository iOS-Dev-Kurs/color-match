//
//  AppDelegate.swift
//  viewhierarchy
//
//  Created by Nils Fischer on 08.05.15.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = UIColor.whiteColor()
        window.makeKeyAndVisible()
        self.window = window
        
        let label = UILabel(frame: CGRect(x: 0, y: 50, width: window.frame.size.width, height: 50))
        label.text = "Hello World!"
        label.backgroundColor = UIColor.redColor()
        window.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: window.frame.size.width / 2 - 40, y: 120, width: 80, height: 44))
        button.backgroundColor = UIColor.blackColor()
        button.setTitle("Click!", forState: .Normal)
        button.addTarget(self, action: "clickButtonPressed:", forControlEvents: .TouchUpInside)
        window.addSubview(button)
        
        return true
    }

    func clickButtonPressed(sender: UIButton) {
        println("Click!")
    }


}

