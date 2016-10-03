//
//  MainViewController.swift
//  Week2_HW
//
//  Created by Kim, YoungKyo (CONT) on 9/30/16.
//  Copyright © 2016 Kyo Kim. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var SpinButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.contentSize = CGSize(width: 1500, height: 667)
        
        scrollView.delegate = self
        
        
       // SpinButton.alpha = 0
       
     
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
   
        }
    
        
        
        
        func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView!) {
            // Get the current page based on the scroll offset
            var page : Int = Int(round(scrollView.contentOffset.x / 375))
            
            // Set the current page, so the dots will update
            pageControl.currentPage = page
            
            
            if pageControl.currentPage == 3{
            
                pageControl.isHidden = true
        
           
            }else {
                
                pageControl.isHidden = false
            }
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
