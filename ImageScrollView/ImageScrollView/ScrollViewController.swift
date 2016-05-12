//
//  ViewController.swift
//  ImageScrollView
//
//  Created by Matthew Benjamin on 5/10/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//
// With help from: http://www.appcoda.com/uiscrollview-introduction/

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

    
    var image = UIImage()
    var theScrollView: UIScrollView!
    var theImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //theImageView.image = image
        
        
        theImageView = UIImageView(image: image)
        
        theScrollView = UIScrollView(frame: view.bounds)
        theScrollView.backgroundColor = UIColor.blackColor()
        theScrollView.contentSize = theImageView.bounds.size
        theScrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        theScrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        theScrollView.contentOffset = CGPoint(x: image.size.width/2, y: image.size.height/2)

        theScrollView.addSubview(theImageView)
        view.addSubview(theScrollView)
        
        theScrollView.delegate = self
        setZoomScale()
        setupGestureRecognizer()

    }
    
    //MARK: Pinch to zoom settings
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return theImageView
    }
    
    func setZoomScale() {
        let imageViewSize = theImageView.bounds.size
        let scrollViewSize = theScrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        theScrollView.minimumZoomScale = min(widthScale, heightScale)
        theScrollView.zoomScale = 1.0
    }
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        let imageViewSize = theImageView.frame.size
        let scrollViewSize = theScrollView.bounds.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
    //MARK: Double Tap to Zoom
    func setupGestureRecognizer() {
        let doubleTap = UITapGestureRecognizer(target: self, action: "handleDoubleTap:")
        doubleTap.numberOfTapsRequired = 2
        theScrollView.addGestureRecognizer(doubleTap)
    }
    
    func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        
        if (theScrollView.zoomScale > theScrollView.minimumZoomScale) {
            theScrollView.setZoomScale(theScrollView.minimumZoomScale, animated: true)
        } else {
            theScrollView.setZoomScale(theScrollView.maximumZoomScale, animated: true)
        }
    }
    
}