//
//  AnimalsListController.swift
//  ZooApp
//
//  Created by Nigar on 21.03.23.
//

import UIKit

class AnimalsListController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var animalsListCollection: UICollectionView!
    
    var animalsList = [AnimalsList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        animalsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalsCollectionViewCell", for: indexPath) as! AnimalsCollectionViewCell
        cell.animalsImage.image = UIImage(named: animalsList[indexPath.item].image)
        cell.animalName.text = animalsList[indexPath.item].animal
        cell.tag = indexPath.item
        cell.animalListCallBack = { index in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AnimalInfoViewController") as! AnimalInfoViewController
            vc.animalsInfo = self.animalsList[index].about
            self.navigationController?.present(vc, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AnimalInfoViewController") as! AnimalInfoViewController
        vc.animalsInfo = animalsList[indexPath.row].about
        navigationController?.present(vc, animated: true)
    }

}
