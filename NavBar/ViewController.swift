//
//  ViewController.swift
//  NavBar
//
//  Created by JOEL CRAWFORD on 2/6/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawerView: UIView!
    @IBOutlet var viewswipe: UIView!

    @IBOutlet weak var allServicesButtonOutlet: UIButton!
    @IBOutlet weak var featuredButtonOutlet: UIButton!
    @IBOutlet weak var favoritesButtonOutlet: UIButton!
    
    
    
    
    
    var mySwipe = UISwipeGestureRecognizer()

    //=========================================================================================================
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //================SWIPE GESTURE====
        
        mySwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        mySwipe.direction = .right // Start with swipe right because drawer is hidden

        view.addGestureRecognizer(mySwipe)

        //===================================
        
        // Do any additional setup after loading the view.
        drawerView.layer.cornerRadius = 10
        drawerView.clipsToBounds      = true     //take the full size of the screen with the items

        //=========bringing it to front==
    
        self.view.bringSubviewToFront(self.drawerView)
        
        //========to hide the drawer======
            
        drawerView.frame = CGRect( x: 0.0 - self.drawerView.frame.size.width, y: 89,  width: self.drawerView.frame.size.width, height: self.drawerView.frame.size.height )
        
        prepTabBarButtons()
        
    }
    
    //==========To be done======
    @IBAction func allservicesbutton(_ sender: UIButton) {
    }
    
    //======action for featured button==
    @IBAction func featuredbutton(_ sender: UIButton) {
    }
    
    ///======action for favourite button====
    @IBAction func favouritebutton(_ sender: UIButton) {
    }
    
    //=========================================================================================================

    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
                    
        slideDrawer()
        
    }
    
    //=========================================================================================================
    
    func slideDrawer() {
        
       //===========when the drawer is to the left===== ie negative
        
        if (drawerView.frame.origin.x < 0) {
            
            mySwipe.direction = .left   // If drawer is hidden, swipe right was enabled, so we switch to swipe right

            UIView.animate(withDuration: 0.25) {
                
                self.drawerView.frame = CGRect(x: 0 , y: self.drawerView.frame.origin.y, width: self.drawerView.frame.size.width, height: self.drawerView.frame.size.height)
               
            }
            
        } else {
            
            mySwipe.direction = .right  // If drawer is open, swipe left was enabled, so we switch to swipe right

            UIView.animate(withDuration: 0.25) {
                
                self.drawerView.frame = CGRect(x: 0 - self.drawerView.frame.size.width, y: self.drawerView.frame.origin.y, width: self.drawerView.frame.size.width, height: self.drawerView.frame.size.height)
                
                
            }
        
        }
                
    }
    
    //======menu button======================================================================================
    
    @IBAction func menu_button(_ sender: UIBarButtonItem) {

        slideDrawer()
        
    }

    //======================================================================================================

    func prepTabBarButtons() {
        
        var hasNotch: Bool = true
        
        // Code below is ugly, but it is the only way I could get Swift/Xcode to accept it
        let buttonWidth: CGFloat = CGFloat( roundf( Float(self.view.bounds.size.width / 3.0) ) ) // Three buttons

        var tempRect: CGRect = allServicesButtonOutlet.frame
        
        tempRect.size.width  = buttonWidth

        if ( __CGSizeEqualToSize(self.view.frame.size, CGSize( width:414.0, height:736.0 ) ) ) {

            hasNotch = false // Set no notch if iPhone 8Plus
            
        } else if ( __CGSizeEqualToSize(self.view.frame.size, CGSize( width:375.0, height:667.0 ) ) ) {
        
            hasNotch = false // Set no notch if iPhone 8

        }
        
        if hasNotch {

            tempRect.size.height = 64 // Make buttons taller if iPhone X or 11
            
            tempRect.origin.y    = self.view.frame.size.height - 98 // 98 = Button height + space for bottom bar

        } else {

            tempRect.size.height = 44 // Keep buttons short for iPhone 8 models

            tempRect.origin.y    = self.view.frame.size.height - 44

        }
        
        
        tempRect.origin.x = 0 // Just making sure
        
        allServicesButtonOutlet.frame = tempRect
        
        tempRect.origin.x += buttonWidth // Move to the right one button width

        featuredButtonOutlet.frame = tempRect
        
        tempRect.origin.x += buttonWidth // Move to the right one button width
        
        // Make sure rightmost button goes up against right side... not 1 or 2 pixels short ( we rounded up above )
        if tempRect.origin.x + tempRect.size.width < self.view.frame.size.width {
            
            tempRect.size.width = self.view.frame.size.width - tempRect.origin.x
            
        }

        favoritesButtonOutlet.frame = tempRect
        
    }

}

