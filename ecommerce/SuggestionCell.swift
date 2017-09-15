//
//  SuggestionCell.swift
//  ecommerce
//
//  Created by Octavianus Gandajaya on 9/15/17.
//  Copyright © 2017 Octavianus Gandajaya. All rights reserved.
//

import UIKit

class SuggestionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image:UIImage!{
        didSet{
            self.imageView.image = image
            setNeedsLayout()
        }
    } }
