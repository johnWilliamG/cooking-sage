//
//  AppDelegate.swift
//  Cooking Sage
//
//  Created by John Galloway on 23/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, LoadingViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //window set up
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white

        
        // Will launch touch id
//        //intial view controller
//        guard let rootVC = UIStoryboard(name: LoadingViewController.StoryBoard.name.rawValue, bundle: .main).instantiateInitialViewController() as? LoadingViewController else {
//            return false
//        }
//        rootVC.delegate = self
//        window?.rootViewController = rootVC
        let navController = UINavigationController()
        let dashboardVC =  RecipeDashboardBuilder().buildViewController()
        navController.viewControllers = [dashboardVC]
        self.window?.rootViewController = navController
        
        return true
    }
    
    func loadingDidFinish() {
        DispatchQueue.main.async {

        }
    }
}

