//
//  AnimalsCollectionViewCell.swift
//  ZooApp
//
//  Created by Nigar on 21.03.23.
//

import UIKit

class AnimalsCollectionViewCell: UICollectionViewCell {
    
    var animalListCallBack: ((Int)->())?
    
    @IBOutlet weak var animalsImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    
    @IBAction func animalAbout(_ sender: Any) {
        animalListCallBack?(tag)
    }
    @IBAction func animalFavorite(_ sender: Any) {
    }
}
