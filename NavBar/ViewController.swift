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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawerView.layer.cornerRadius = 10
        drawerView.clipsToBounds      = true     //take the full size of the screen with the items

        //=========bringing it to front==
    
        self.view.bringSubviewToFront(self.drawerView)
        
        //========to hide the drawer======
            
        drawerView.frame = CGRect( x: 0.0 - self.drawerView.frame.size.width, y: 89,  width: self.drawerView.frame.size.width, height: self.drawerView.frame.size.height )
    }
    
    //======menu button======================================================================================
    
    @IBAction func menu_button(_ sender: UIBarButtonItem) {
        
       //===========when the drawer is ro the left===== ie negative
        
        if (drawerView.frame.origin.x < 0) {
            
            UIView.animate(withDuration: 0.25) {
                
                self.drawerView.frame = CGRect(x: 0 , y: self.drawerView.frame.origin.y, width: self.drawerView.frame.size.width, height: self.drawerView.frame.size.height)
               
            }
            
        } else {
            
            UIView.animate(withDuration: 0.25) {
                
                self.drawerView.frame = CGRect(x: 0 - self.drawerView.frame.size.width, y: self.drawerView.frame.origin.y, width: self.drawerView.frame.size.width, height: self.drawerView.frame.size.height)
                
                
            }
        
        }
        
        
    }
    
    
}

