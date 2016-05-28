//
//  ViewController.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-16.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HolderViewDelegate {
  
  var holderView = HolderView(frame: CGRectZero)
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    addHolderView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
    
  func addHolderView() {
    let boxSize: CGFloat = 100.0
    holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                              y: view.bounds.height / 2 - boxSize / 2,
                              width: boxSize,
                              height: boxSize)
    holderView.parentFrame = view.frame
    holderView.delegate = self
    view.addSubview(holderView)
    
    holderView.addOval() //This calls addOval to kickstart the animation after it has been added to the view controller’s view.
    
  }
  
  func animateLabel() {
    // 1 Remove HolderView from the view and set the view’s background color to blue.
    holderView.removeFromSuperview()
    view.backgroundColor = Colors.blue
    
    // 2 Create a UILabel with text of ‘S’ to represent the logo, and add it to the view.
    let label: UILabel = UILabel(frame: view.frame)
    label.textColor = Colors.white
    label.font = UIFont(name: "HelveticaNeue-Thin", size: 170.0)
    label.textAlignment = NSTextAlignment.Center
    label.text = "MB"
    label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
    view.addSubview(label)
    
    // 3 Apply a spring animation to the label to scale it in. Once the animation is done, call addButton() to add a button to your view, which, when pressed, repeats the animation.
    UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0)
        }), completion: { finished in
            self.addButton()
    })
  }
  
  func addButton() {
    let button = UIButton()
    button.frame = CGRectMake(0.0, 0.0, view.bounds.width, view.bounds.height)
    button.addTarget(self, action: #selector(ViewController.buttonPressed(_:)), forControlEvents: .TouchUpInside)
    view.addSubview(button)
  }
  
  func buttonPressed(sender: UIButton!) {
    view.backgroundColor = Colors.white
    holderView = HolderView(frame: CGRectZero)
    addHolderView()
  }
}

