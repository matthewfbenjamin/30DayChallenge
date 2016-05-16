//
//  CollectionViewCell.swift
//  CarouselEffect
//
//  Created by Matthew Benjamin on 4/22/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    //MARK: Public API
    var interest: Interest!{
        didSet{
            updateUI()
        }
    }
    
    //MARK: Private
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!


    private func updateUI(){
        interestTitleLabel?.text! = interest.title
        featuredImageView?.image! = interest.featuredImage
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius =  10.0
        self.clipsToBounds = true
    }

}
