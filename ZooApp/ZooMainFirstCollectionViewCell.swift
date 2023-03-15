//
//  ZooMainFirstCollectionViewCell.swift
//  ZooApp
//
//  Created by Nigar on 09.03.23.
//

import UIKit

class ZooMainFirstCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var zooListImage: UIImageView!
    @IBOutlet weak var zooNameLabel: UILabel!
    @IBOutlet weak var zooInfoLabel: UILabel!
    
    var infoZooCallBack: ((Int)->())?
    
    @IBAction func favoriteZooListButton(_ sender: Any) {
        
    }
    
    @IBAction func infoZooListButton(_ sender: Any) {
        infoZooCallBack?(tag)
    }
    
}
