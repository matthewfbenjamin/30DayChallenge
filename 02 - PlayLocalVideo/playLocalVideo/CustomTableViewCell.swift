//
//  CustomTableViewCell.swift
//  playLocalVideo
//
//  Created by Matthew Benjamin on 4/13/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoName: UILabel!
    @IBOutlet weak var videoTime: UILabel!
    var youtubeID: String!
}
