//
//  SliderImageController.swift
//  ecommerce
//
//  Created by Octavianus Gandajaya on 9/12/17.
//  Copyright © 2017 Octavianus Gandajaya. All rights reserved.
//

import UIKit

class SliderImageController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?{
        didSet{
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.imageView.image = image
        // Do any additional setup after loading the view.
    }


}
