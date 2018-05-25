//
//  ViewController.swift
//  Cooking Sage
//
//  Created by John Galloway on 23/05/2018.
//  Copyright © 2018 John Galloway. All rights reserved.
//

import UIKit
import LocalAuthentication

protocol LoadingViewControllerDelegate {
    
    func loadingDidFinish()
    
}

class LoadingViewController: UIViewController {

    let myContext = LAContext()
    let myLocalizedReasonString = "Authenticate To Log In"
    var delegate: LoadingViewControllerDelegate?

    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        var authError: NSError?
        
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { [weak self] success, evaluateError in
                    if success {
                        let alert = UIAlertController(title: "Awesome", message: "Well done for loggin in ", preferredStyle: .alert)
                        self?.show(alert, sender: nil)
                        self?.delegate?.loadingDidFinish()
                    } else {
                        print(evaluateError?.localizedDescription ?? "Unknown Error")
                    }
                }
            } else {
                presentShitError()
            }
        } else {
            presentShitError()
        }
    }
    
    func presentShitError() {
        let alert = UIAlertController(title: "This is Shit!", message: "Your crappy device doesn't have touch ID....", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Well I guess you can advance anyway", style: .default) { [weak self] _ in
            self?.delegate?.loadingDidFinish()
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    enum StoryBoard: String {
        case name = "LoadingViewController"
    }
}

