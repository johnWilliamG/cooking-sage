//
//  AppDelegate.swift
//  Cooking Sage
//
//  Created by John Galloway on 23/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit
import WebKit
import SafariServices


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //window set up
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        //Set Recipe Dashboard as first view controller
        let navController = UINavigationController()
        let dashboardVC =  RecipeDashboardBuilder().buildViewController()
        navController.viewControllers = [dashboardVC]
        self.window?.rootViewController = navController
        
        //Set Up Touch ID for launch
        /*
         guard let rootVC = UIStoryboard(name: LoadingViewController.StoryBoard.name.rawValue, bundle: .main).instantiateInitialViewController() as? LoadingViewController else {
             return false
         }
         rootVC.delegate = self
         window?.rootViewController = rootVC
         */
        
        return true
    }
}

/*
 extension AppDelegate: LoadingViewControllerDelegate {
 
    func loadingDidFinish() {
        DispatchQueue.main.async {
            //set view controller after touch id did finish
        }
     }
 }
 */
