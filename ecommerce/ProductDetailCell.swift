//
//  ProductDetailCell.swift
//  ecommerce
//
//  Created by Octavianus Gandajaya on 9/12/17.
//  Copyright © 2017 Octavianus Gandajaya. All rights reserved.
//

import UIKit

class ProductDetailCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
   
    var product: Product?{
        didSet{
            productNameLabel.text = product?.name
            productDescriptionLabel.text = product?.description
        }
    }
}
