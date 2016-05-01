//
//  FirstViewController.swift
//  TabbarViewTest
//
//  Created by xjc on 16/5/1.
//  Copyright © 2016年 xjc. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var swipeLeft:UISwipeGestureRecognizer!
    var swipeRight:UISwipeGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector("tappedRightButton"))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        swipeRight = UISwipeGestureRecognizer(target: self, action: Selector("tappedLeftButton"))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    
    func tappedRightButton() {
        
        let selectedIndex = self.tabBarController?.selectedIndex
        let arrayViewController = self.tabBarController?.viewControllers
        
        if selectedIndex! < (arrayViewController?.count)!-1 {
            let fromView = self.tabBarController?.selectedViewController?.view
            let toView = self.tabBarController?.storyboard?.instantiateViewControllerWithIdentifier("Second").view
            
            
            UIView.transitionFromView(fromView!, toView: toView!, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: { (finished) -> Void in
                if(finished) {
                    self.tabBarController?.selectedIndex = 1
                }
            })
            
        }
    }
    
    func tappedLeftButton() {
        let selectedIndex = self.tabBarController?.selectedIndex
        
        if(selectedIndex>0) {
            let fromView = self.tabBarController?.selectedViewController?.view
            
            let toView = self.tabBarController?.storyboard?.instantiateViewControllerWithIdentifier("First").view
            
            UIView.transitionFromView(fromView!, toView: toView!, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: { (finished) -> Void in
                if(finished) {
                    self.tabBarController?.selectedIndex = 0
                }
            })
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

