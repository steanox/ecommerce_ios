//
//  ProductBuyButtonCell.swift
//  ecommerce
//
//  Created by Octavianus Gandajaya on 9/12/17.
//  Copyright © 2017 Octavianus Gandajaya. All rights reserved.
//

import UIKit

class ProductBuyButtonCell: UITableViewCell {

    @IBOutlet weak var productBuyButton: UIButton!
    
    var product: Product?{
        didSet{
            productBuyButton.setTitle("BUY \(product!.name!)", for: [])
        }
    }
}
