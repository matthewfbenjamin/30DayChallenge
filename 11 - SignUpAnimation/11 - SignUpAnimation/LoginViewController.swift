//
//  LoginViewController.swift
//  11 - SignUpAnimation
//
//  Created by Matthew Benjamin on 5/18/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButtonOutlet: UIButton!

    override func viewDidAppear(animated: Bool) {
        //super.viewDidAppear(animated)
        
        emailTextField.center.x -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width
        signUpButtonOutlet.center.x -= view.bounds.width
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: {
            self.emailTextField.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.2, options: .CurveEaseOut, animations: {
            self.passwordTextField.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.signUpButtonOutlet.center.x += self.view.bounds.width
            }, completion: nil)
    }

    @IBAction func signUpButtonClicked(sender: AnyObject) {
        signUpButtonOutlet.transform = CGAffineTransformMakeScale(0.1, 0.1)

        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: 0.2,
                                   initialSpringVelocity: 6.0,
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.signUpButtonOutlet.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
}
