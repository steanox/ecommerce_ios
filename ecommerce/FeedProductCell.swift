//
//  FeedProductCell.swift
//  ecommerce
//
//  Created by Octavianus Gandajaya on 9/12/17.
//  Copyright © 2017 Octavianus Gandajaya. All rights reserved.
//

import UIKit

class FeedProductCell:UITableViewCell{

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var product: Product?{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        
        if let product = product{
            productImageView.image = product.images?.first
            productNameLabel.text = product.name
            productPriceLabel.text = "Rp. \(product.price!)"
        }
    }
    
}
