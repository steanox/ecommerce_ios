//
//  ProductSliderView.swift
//  ecommerce
//
//  Created by Octavianus Gandajaya on 9/15/17.
//  Copyright © 2017 Octavianus Gandajaya. All rights reserved.
//

import UIKit

class ProductSliderView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!

}

extension ProductSliderView: SliderImagesPageViewControllerDelegate{
    
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
}
