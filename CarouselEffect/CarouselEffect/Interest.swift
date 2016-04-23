//
//  Interest.swift
//  CarouselEffect
//
//  Created by Matthew Benjamin on 4/22/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class Interest
{
    // MARK: - Public API
    var id = ""
    var title = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage!
    
    init(id: String, title: String, description: String, featuredImage: UIImage!)
    {
        self.id = id
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        numberOfMembers = 1
        numberOfPosts = 1
    }
    
    // MARK: - Private
    
    static func createInterests() -> [Interest]
    {
        return [
            Interest(id: "r1", title: "We Love Traveling Around the World", description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r1")!),
            
            Interest(id: "r2", title: "Dandelion", description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r2")!),
            
            Interest(id: "r3", title: "Homes on the Water", description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r3")!),
            
            Interest(id: "r4", title: "Golden Gate Bridge", description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r4")!),
            
            Interest(id: "r5", title: "Fancy Meal Prep", description: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r5")!),
            
            Interest(id: "r6", title: "Burrito and Coffee", description: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r6")!),
        ]
    }
}