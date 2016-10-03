//
//  BackViewController.swift
//  Week2_HW
//
//  Created by Kim, YoungKyo (CONT) on 9/30/16.
//  Copyright © 2016 Kyo Kim. All rights reserved.
//

import UIKit

class BackViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var SignOutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        scrollView.contentSize = CGSize(width: 375, height: 900)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
    
   
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 
 
    @IBAction func didPressSignOut(_ sender: AnyObject) {
        
        
        
        
        let alertController = UIAlertController(title: "Woops", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        
        
        
        
        let logoutAction = UIAlertAction(title: "Log Out", style: .destructive) { (action) in
            // handle case of user logging out
            
            
            self.performSegue(withIdentifier: "logOutSegue", sender: nil)

            
        }
        
        
        //     add the logout action to the alert controller
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        
        
        
        alertController.addAction(logoutAction)
        alertController.addAction(cancelAction)

        
        
        
        present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
          
            
            
        }

    }
    
    
    @IBAction func XButton(_ sender: AnyObject) {
        
         dismiss(animated: true, completion: nil)
    }
    
    
}
