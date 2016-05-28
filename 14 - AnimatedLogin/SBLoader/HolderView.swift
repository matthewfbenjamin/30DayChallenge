//
//  HolderView.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-17.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

protocol HolderViewDelegate:class {
    
  func animateLabel()
}

class HolderView: UIView {
    
  //MARK: PROPERTIES
    let ovalLayer = OvalLayer()
    let triangleLayer = TriangleLayer()
    let redRectangleLayer = RectangleLayer()
    let blueRectangleLayer = RectangleLayer()
    let arcLayer = ArcLayer()

    
  var parentFrame :CGRect = CGRectZero
  weak var delegate:HolderViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = Colors.clear
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
    
  //MARK: FUNCTIONS
    
    // Adds the two OvalLayer instance you created above as a sublayer to the view’s layer, then calls expand() and wobble() functions
    func addOval() {
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(HolderView.wobbleOval), userInfo: nil, repeats: false)
    }
    func wobbleOval() {
        // 1 This line adds the TriangleLayer instance you initialized earlier as a sublayer to the HolderView‘s layer.
        layer.addSublayer(triangleLayer)
        ovalLayer.wobble()
        
        // 2 Since you know that the wobble animation runs twice for a total duration of 1.8, the half-way point would be a great place to start the morphing process. You therefore add a timer that adds drawAnimatedTriangle() after a delay of 0.9.
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(HolderView.drawAnimatedTriangle), userInfo: nil, repeats: false)
    }
    
    //Adds the function from TriangleLayer()
    func drawAnimatedTriangle() {
        triangleLayer.animate()
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(HolderView.spinAndTransform),userInfo: nil, repeats: false)
    }
    
    func spinAndTransform() {
        // 1 Update the anchor point of the layer to be slightly below the center of the view. This affords a rotation that appears more natural. This is because the oval and triangle are actually offset from the center of the view, vertically. So if the view was rotated around its center, then the oval and triangle would appear to move vertically.
        layer.anchorPoint = CGPointMake(0.5, 0.6)
        
        // 2 Apply a CABasicAnimation to rotate the layer 360 degrees, or 2*Pi radians. The rotation is around the z-axis, which is the axis going into and out of the screen, perpendicular to the screen surface.
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(M_PI * 2.0)
        rotationAnimation.duration = 0.45
        rotationAnimation.removedOnCompletion = true
        layer.addAnimation(rotationAnimation, forKey: nil)
        
        // 3 Call contract() on OvalLayer to perform the animation that reduces the size of the oval until it’s no longer visible.
        ovalLayer.contract()
        
        // 4 draw the red rectangle first, right after the rotation animation is complete. The blue rectangle’s stroke begins as the red rectangle’s stroke draws close to completion.
        NSTimer.scheduledTimerWithTimeInterval(0.45, target: self,
                                               selector: #selector(HolderView.drawRedAnimatedRectangle),
                                               userInfo: nil, repeats: false)
        NSTimer.scheduledTimerWithTimeInterval(0.65, target: self,
                                               selector: #selector(HolderView.drawBlueAnimatedRectangle),
                                               userInfo: nil, repeats: false)
    }
    
    func drawRedAnimatedRectangle() {
        layer.addSublayer(redRectangleLayer)
        redRectangleLayer.animateStrokeWithColor(UIColor.redColor())
    }
    
    func drawBlueAnimatedRectangle() {
        layer.addSublayer(blueRectangleLayer)
        blueRectangleLayer.animateStrokeWithColor(UIColor.blueColor())
        
      
        NSTimer.scheduledTimerWithTimeInterval(0.40, target: self, selector: #selector(HolderView.drawArc),userInfo: nil, repeats: false)
    }
    
    func drawArc() {
        layer.addSublayer(arcLayer)
        arcLayer.animate()
        NSTimer.scheduledTimerWithTimeInterval(0.90, target: self, selector: #selector(HolderView.expandView), userInfo: nil, repeats: false)
    }
    
    func expandView() {
        // 1 The background of the holder view is set to blue, to match the color you filled the rectangle with.
        backgroundColor = Colors.blue
        
        // 2 The frame is expanded to account for the RectangleLayer‘s stroke width that you added earlier.
        frame = CGRectMake(frame.origin.x - blueRectangleLayer.lineWidth,
                           frame.origin.y - blueRectangleLayer.lineWidth,
                           frame.size.width + blueRectangleLayer.lineWidth * 2,
                           frame.size.height + blueRectangleLayer.lineWidth * 2)
        
        // 3 All sublayers are removed. Now there are no oval, no triangle and no rectangle layers.
        layer.sublayers = nil
        
        // 4 An animation is added to expand the HolderView to fill the screen. Once that animation’s done, you call addLabel().
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut,
                                   animations: {
                                    self.frame = self.parentFrame
            }, completion: { finished in
                self.addLabel()
        })
    }
    
    
    func addLabel() {
        delegate?.animateLabel()
    }
}
