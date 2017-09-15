//
//  ProductDetailTVC.swift
//  ecommerce
//
//  Created by Octavianus Gandajaya on 9/12/17.
//  Copyright © 2017 Octavianus Gandajaya. All rights reserved.
//

import UIKit

class ProductDetailTVC: UIViewController {

    var product: Product?
    
    @IBOutlet weak var productSliderView: ProductSliderView!
    @IBOutlet weak var tableView: UITableView!
    
    
    struct Storyboard{
        static let showImagePage = "showImagePage"
        static let productDetailCell = "productDetailCell"
        static let showProductDetailCell = "showProductDetailCell"
        static let buyButtonCell = "productBuyButtonCell"
        static let suggestionCell = "suggestionCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTable()

    }
    
    func configureTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    

}





extension ProductDetailTVC: UITableViewDelegate,UITableViewDataSource{


    //MARK:- DATA SOURCE
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTVC.Storyboard.productDetailCell, for: indexPath) as! ProductDetailCell
            cell.product = self.product
            cell.selectionStyle = .none
            
            return cell
            
        }else
        if indexPath.row == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTVC.Storyboard.buyButtonCell, for: indexPath) as! ProductBuyButtonCell
                cell.product = self.product
                cell.selectionStyle = .none
                
                
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTVC.Storyboard.showProductDetailCell, for: indexPath)
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTVC.Storyboard.suggestionCell, for: indexPath) as! SuggestionTableViewCell
            return cell
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showImagePage{
            let dest = segue.destination as! SliderImagesPageViewController
            dest.images = product?.images
            dest.pageViewDelegate = productSliderView
        }
    }
    
    
    //MARK: DELEGATE METHOD
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3{
            return tableView.bounds.width + 45
        }else{
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 3{
            if let cell = cell as? SuggestionTableViewCell{
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                
                cell.collectionView.reloadData()
            }
        }
    }//end func
}

extension ProductDetailTVC:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "suggestionCellCollection", for: indexPath) as! SuggestionCell

        let products = Product.fetchData()
        cell.image = products[indexPath.row].images?.first
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
}

extension ProductDetailTVC:UICollectionViewDelegate{

}

extension ProductDetailTVC:UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumLineSpacing = 5.0
            let itemWidth = (collectionView.bounds.width - 5.0) / 2
            return CGSize(width: itemWidth, height: itemWidth)
        }
        
        return CGSize.zero
    }
    
}


