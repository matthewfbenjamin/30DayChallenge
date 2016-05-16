//
//  HomeViewController.swift
//  CarouselEffect
//
//  Created by Matthew Benjamin on 4/22/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var currentUserProfileImageButton: UIButton!
    @IBOutlet weak var currentUserFullNameButton: UIButton!
    
    //MARK: UICollectionViewDataSource
    private var interests = Interest.createInterests()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private struct Storyboad{
        static let CellIdentifier = "Interest Cell"
    }
}

extension HomeViewController : UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboad.CellIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        cell.interest = self.interests[indexPath.item]
        
        return cell
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing //minimumLineSpacing for scrolling horizontally
        
        var offset = targetContentOffset.memory
        let index = (offset.x + scrollView.contentInset.left)/cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        
        targetContentOffset.memory = offset
        
        
        
        
        
        
        
    }
}