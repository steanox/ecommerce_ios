//
//  FeedTableViewController.swift
//  ecommerce
//
//  Created by Octavianus Gandajaya on 9/12/17.
//  Copyright © 2017 Octavianus Gandajaya. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    var products: [Product]?
    var selectedProduct: Product?
    
    struct Storyboard{
        static let feedProductCell = "feedCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Feed"
        fetchProducts()
        //tableView.estimatedRowHeight = tableView.rowHeight
        //tableView.rowHeight = UITableViewAutomaticDimension
        
       


    }
    
    
    func fetchProducts(){
        products = Product.fetchData()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let products = products{
            return products.count
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewController.Storyboard.feedProductCell, for: indexPath) as! FeedProductCell
        
        if let products = products{
            let product = products[indexPath.row]
            cell.product = product
            cell.selectionStyle = .none
        }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var productDetailTVC = ProductDetailTVC()
//        productDetailTVC.product = products?[indexPath.row]
//        
//        navigationController?.pushViewController(productDetailTVC, animated: true)
        selectedProduct = products?[indexPath.row]
        performSegue(withIdentifier: "showProductDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetailSegue"{
            let dest = segue.destination as! ProductDetailTVC
            dest.product = self.selectedProduct
        }
    }

}
