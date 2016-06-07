//
//  TransistionManager.swift
//  16 - TumblrMenuReCreation
//
//  Created by Matthew Benjamin on 6/7/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate  {
    
    private var presenting = false
    
    // MARK: UIViewControllerAnimatedTransitioning protocol methods
    
    // animate a change from one viewcontroller to another
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // get reference to our fromView, toView and the container view that we should perform the transition in
        let container = transitionContext.containerView()
        
        // create a tuple of our screens
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        // assign references to our menu view controller and the 'bottom' view controller from the tuple
        // remember that our menuViewController will alternate between the from and to view controller depending if we're presenting or dismissing
        let menuViewController = !self.presenting ? screens.from as! MenuScreenViewController : screens.to as! MenuScreenViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        // setup 2D transitions for animations
        let topRowOffset  :CGFloat = 50
        let middleRowOffset :CGFloat = 150
        let bottomRowOffset  :CGFloat = 300
        
        menuViewController.textIcon.transform = self.offStage(-topRowOffset, yAmount: 0)
        menuViewController.chatIcon.transform = self.offStage(-middleRowOffset, yAmount: 0.0)
        menuViewController.messageIcon.transform = self.offStage(-bottomRowOffset, yAmount:0)
        menuViewController.photoIcon.transform = self.offStage(topRowOffset, yAmount: 0)
        menuViewController.linkIcon.transform = self.offStage(middleRowOffset, yAmount: 0)
        menuViewController.musicIcon.transform = self.offStage(bottomRowOffset, yAmount: 0)
        menuViewController.cancelButtonOutlet.transform = self.offStage(0, yAmount: 150)
        
        // prepare the menu
        if (self.presenting){
            menuView.alpha = 0
            
            // prepare menu items to slide in            
            menuViewController.textIcon.transform = self.offStage(-topRowOffset, yAmount: 0)
            menuViewController.chatIcon.transform = self.offStage(-middleRowOffset, yAmount: 0.0)
            menuViewController.messageIcon.transform = self.offStage(-bottomRowOffset, yAmount:0)
            menuViewController.photoIcon.transform = self.offStage(topRowOffset, yAmount: 0)
            menuViewController.linkIcon.transform = self.offStage(middleRowOffset, yAmount: 0)
            menuViewController.musicIcon.transform = self.offStage(bottomRowOffset, yAmount: 0)
            menuViewController.cancelButtonOutlet.transform = self.offStage(0, yAmount: 150)
            
        }
        if let contain = container, bV = bottomView, mV = menuView{
        // add the both views to our view controller
        contain.addSubview(bV)
        contain.addSubview(mV)
        
        let duration = self.transitionDuration(transitionContext)
        
        // perform the animation!
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
            
            if (self.presenting){
                // fade in
                menuView.alpha = 1
                
                // onstage items: slide in
                menuViewController.textIcon.transform = CGAffineTransformIdentity
                menuViewController.chatIcon.transform = CGAffineTransformIdentity
                menuViewController.messageIcon.transform = CGAffineTransformIdentity
                menuViewController.photoIcon.transform = CGAffineTransformIdentity
                menuViewController.linkIcon.transform = CGAffineTransformIdentity
                menuViewController.musicIcon.transform = CGAffineTransformIdentity
                menuViewController.cancelButtonOutlet.transform = CGAffineTransformIdentity

            }
            else {
                // fade out
                menuView.alpha = 0
                
                // offstage items: slide out
                menuViewController.textIcon.transform = self.offStage(-topRowOffset, yAmount: 0)
                menuViewController.chatIcon.transform = self.offStage(-middleRowOffset, yAmount: 0.0)
                menuViewController.messageIcon.transform = self.offStage(-bottomRowOffset, yAmount:0)
                menuViewController.photoIcon.transform = self.offStage(topRowOffset, yAmount: 0)
                menuViewController.linkIcon.transform = self.offStage(middleRowOffset, yAmount: 0)
                menuViewController.musicIcon.transform = self.offStage(bottomRowOffset, yAmount: 0)
                menuViewController.cancelButtonOutlet.transform = self.offStage(0, yAmount: 150)

                
                
            }
            }, completion: { finished in
                
                // tell our transitionContext object that we've finished animating
                transitionContext.completeTransition(true)
                
                // bug: we have to manually add our 'to view' back http://openradar.appspot.com/radar?id=5320103646199808
                UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
                
        })
        
    }
    }
    // return how many seconds the transiton animation will take
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.0
    }
    
    // MARK: UIViewControllerTransitioningDelegate protocol methods
    
    // return the animataor when presenting a viewcontroller
    // rememeber that an animator (or animation controller) is any object that aheres to the UIViewControllerAnimatedTransitioning protocol
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
    func offStage(xAmount: CGFloat, yAmount: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(xAmount, yAmount)
    }


}