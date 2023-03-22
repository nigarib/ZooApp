//
//  AnimalInfoViewController.swift
//  ZooApp
//
//  Created by Nigar on 22.03.23.
//

import UIKit

class AnimalInfoViewController: UIViewController {

    var animalsInfo: AboutAnimalsList?
    
    @IBOutlet weak var animalName: UILabel!

    @IBOutlet weak var animalInfo: UITextView!
    @IBOutlet weak var animalInfoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animalInfoImage.image = UIImage(named: animalsInfo?.image ?? "")
        animalInfo.text = animalsInfo?.info
        animalName.text = animalsInfo?.name
    }
    


}
