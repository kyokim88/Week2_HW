//
//  IntroViewController.swift
//  Week2_HW
//
//  Created by Kim, YoungKyo (CONT) on 9/27/16.
//  Copyright © 2016 Kyo Kim. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
  
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
   
    // Arrays of initial transform values for tiles
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 375, height: 1300)
        
        scrollView.delegate = self
        
        scrollView.sendSubview(toBack: imageView)
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        let Offset = Float(scrollView.contentOffset.y)
        
        //content offset: 0>620
        //x offset: -30>0
        //y offset: -285>0
        
        let tx = convertValue(value: Offset, r1Min: 0, r1Max: 610, r2Min: -30, r2Max: 0)
        
        let ty = convertValue(value: Offset, r1Min: 0, r1Max: 610, r2Min: -285, r2Max: 0)
        
        let scale = convertValue(value: Offset, r1Min: 0, r1Max: 610, r2Min: 1, r2Max: 1)
        
        let rotation = convertValue(value: Offset, r1Min: 0, r1Max: 610, r2Min: -10, r2Max: 0)
        
        
       
        let tx2 = convertValue(value: Offset, r1Min: 0, r1Max: 620, r2Min: -30, r2Max: 0)
        
        let ty2 = convertValue(value: Offset, r1Min: 0, r1Max: 620, r2Min: 285, r2Max: 0)
        
        let scale2 = convertValue(value: Offset, r1Min: 0, r1Max: 620, r2Min: 1, r2Max: 1)
        
        let rotation2 = convertValue(value: Offset, r1Min: 0, r1Max: 620, r2Min: -80, r2Max: 0)
        

        
        
        tile1View.transform =
            CGAffineTransform(translationX: CGFloat(tx),y: CGFloat(ty))
        
        tile1View.transform =
            tile1View.transform.scaledBy(x: CGFloat(scale), y: CGFloat(scale))
        tile1View.transform = tile1View.transform.rotated(by: CGFloat(Double(rotation) * M_PI / 180))
    ////
        
        tile2View.transform =
            CGAffineTransform(translationX: CGFloat(tx2),y: CGFloat(ty2))
        
        tile2View.transform =
            tile1View.transform.scaledBy(x: CGFloat(scale2), y: CGFloat(scale2))
        tile2View.transform = tile1View.transform.rotated(by: CGFloat(Double(rotation2) * M_PI / 180))
       
     ////
        tile3View.transform =
            CGAffineTransform(translationX: CGFloat(tx),y: CGFloat(ty))
        
        tile3View.transform =
            tile1View.transform.scaledBy(x: CGFloat(scale), y: CGFloat(scale))
        tile3View.transform = tile1View.transform.rotated(by: CGFloat(Double(rotation) * M_PI / 180))
        
        
        tile4View.transform =
            CGAffineTransform(translationX: CGFloat(tx),y: CGFloat(ty))
        
        tile4View.transform =
            tile1View.transform.scaledBy(x: CGFloat(scale), y: CGFloat(scale))
        tile4View.transform = tile1View.transform.rotated(by: CGFloat(Double(rotation) * M_PI / 180))
        
        
        tile5View.transform =
            CGAffineTransform(translationX: CGFloat(tx),y: CGFloat(ty))
        
        tile5View.transform =
            tile1View.transform.scaledBy(x: CGFloat(scale), y: CGFloat(scale))
        tile5View.transform = tile1View.transform.rotated(by: CGFloat(Double(rotation) * M_PI / 180))
        
        
        tile6View.transform =
            CGAffineTransform(translationX: CGFloat(tx),y: CGFloat(ty))
        
        tile6View.transform =
            tile1View.transform.scaledBy(x: CGFloat(scale), y: CGFloat(scale))
        tile6View.transform = tile1View.transform.rotated(by: CGFloat(Double(rotation) * M_PI / 180))
    }
    
    
    
    func convertValue(value:Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max:Float) -> Float {
    let ratio = (r2Max - r2Min) / (r1Max - r1Min)
    return value * ratio + r2Min - r1Min * ratio
    
        }
    
    
    func transformView(view : UIView!, atIndex index: Int, offset : Float){
    
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
