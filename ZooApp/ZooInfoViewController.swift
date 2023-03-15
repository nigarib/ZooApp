//
//  ZooInfoViewController.swift
//  ZooApp
//
//  Created by Nigar on 13.03.23.
//

import UIKit

class ZooInfoViewController: UIViewController {
    
    var zooInfo: AboutZooList?
    
    @IBOutlet weak var zooInfoImage: UIImageView!
    
    @IBOutlet weak var zooInfoName: UILabel!
    
    @IBOutlet weak var zooInfoAddress: UILabel!
    @IBOutlet weak var zooInfoPhone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zooInfoImage.image = UIImage(named: zooInfo?.image ?? "")
        zooInfoName.text = zooInfo?.name
        zooInfoAddress.text = zooInfo?.address
        zooInfoPhone.text = zooInfo?.phone
    }
    
    

}
