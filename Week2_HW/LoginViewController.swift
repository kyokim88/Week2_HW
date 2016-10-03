//
//  LoginViewController.swift
//  Week2_HW
//
//  Created by Kim, YoungKyo (CONT) on 9/27/16.
//  Copyright © 2016 Kyo Kim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    
    
    @IBOutlet weak var fieldParentView: UIView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    
    @IBOutlet weak var buttonParentView: UIView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
 
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    ///////////////////////////////////////////////
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.loginIndicator.isHidden = true
        
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display
            
            self.fieldParentView.frame.origin.y = self.initialY + self.offset
            
            
            _ = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            // do stuff based on the keyboard frame
            
            self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            
            
            _ = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            // do stuff based on the keyboard frame
            
            
            // The keyboard is about to be shown...
            func keyboardWillShow(notification: NSNotification) {
                print("keyboardWillShow")
                // Move the button up above keyboard
                self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
                // Scroll the scrollview up
                self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
            }
            
        
            
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
            
            self.fieldParentView.frame.origin.y = self.initialY
            
            self.buttonParentView.frame.origin.y = self.buttonInitialY
        }

        
        
        
        initialY = fieldParentView.frame.origin.y
        offset = -80
        
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -230
 
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func OnBackButton(_ sender: AnyObject) {
        
        navigationController?.popViewController(animated: true)

        
    }
    

    @IBAction func onTap(_ sender: AnyObject) {
        
        
        view.endEditing(true)}
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    
    
    @IBAction func didPressLogin(_ sender: AnyObject) {
        
        loginIndicator.isHidden = false
        loginIndicator.startAnimating()
        
        
        delay(2){
            
            self.loginIndicator.stopAnimating()
            
            if self.emailField.text! == "kyo" && self.passwordField.text! == "pass"{
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            } else if self.emailField.text!.isEmpty || self.passwordField.text!.isEmpty{
                
                let errorAlertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .alert)
                
                let okEnterAction = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                    
                })
                
                errorAlertController.addAction(okEnterAction)
                
                self.present(errorAlertController, animated: true){
                    
                    self.loginIndicator.isHidden = true
                    
                }
                
            } else{
                
                    let loginErrorAlertController = UIAlertController(title: "Invalid Email or Password", message: "Please try again.", preferredStyle: .alert)
                    
                    let okTryAction = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                        
                    })
                    
                    loginErrorAlertController.addAction(okTryAction)
                    
                    self.present(loginErrorAlertController, animated: true){
                        
                        self.loginIndicator.isHidden = true
                        
                    }
                    
                }
            
    }

    }
 
    
}




