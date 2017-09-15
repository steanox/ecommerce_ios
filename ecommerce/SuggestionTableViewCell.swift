//
//  SuggestionTableViewCell.swift
//  ecommerce
//
//  Created by Octavianus Gandajaya on 9/15/17.
//  Copyright © 2017 Octavianus Gandajaya. All rights reserved.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.dataSource = self
        }
    }

}

extension SuggestionTableViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

}
