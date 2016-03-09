//
//  PhotoTableViewCell.swift
//  pinsta
//
//  Created by Himank Yadav on 3/6/16.
//  Copyright © 2016 himankyadav. All rights reserved.
//

import UIKit
import ParseUI

class PhotoTableViewCell: PFTableViewCell {

    @IBOutlet weak var photoImageView: PFImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    var instagramPost: PFObject! {
        didSet {
            self.photoImageView.file = instagramPost["media"] as? PFFile
            self.photoImageView.loadInBackground()
            self.captionLabel.text = instagramPost["caption"] as! String
        }
    }
    
}
