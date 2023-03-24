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
    var favZooCallBack: (()->())?
    
    @IBAction func favoriteZooListButton(_ sender: Any) {
        favZooCallBack?()
    }
    
    @IBAction func infoZooListButton(_ sender: Any) {
        infoZooCallBack?(tag)
    }
    
}
