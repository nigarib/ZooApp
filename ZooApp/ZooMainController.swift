//
//  ZooMainController.swift
//  ZooApp
//
//  Created by Nigar on 07.03.23.
//

import UIKit

class ZooMainController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var searchOutlet: UISearchBar!
    @IBOutlet weak var zooListCollectionView: UICollectionView!
    var zooList = [ZooList]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zooListJsonRead()
        
    }
    
    func zooListJsonRead() {
        if let jsonFile = Bundle.main.url(forResource: "ZooList", withExtension: "json"),
           let data = try? Data(contentsOf: jsonFile) {
            do {
                zooList = try JSONDecoder().decode([ZooList].self, from: data)
                zooListCollectionView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File not found")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        zooList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZooMainFirstCollectionViewCell", for: indexPath) as! ZooMainFirstCollectionViewCell
        cell.zooListImage.image = UIImage(named: zooList[indexPath.item].image)
        cell.zooNameLabel.text = zooList[indexPath.item].name
        cell.zooInfoLabel.text = zooList[indexPath.item].info
        cell.tag = indexPath.item
        cell.infoZooCallBack = { index in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ZooInfoViewController") as! ZooInfoViewController
            vc.zooInfo = self.zooList[index].about
            self.navigationController?.present(vc, animated: true)
        }
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 10
        print(collectionView.frame.width)
        print(width)
        return CGSize(width: width - 24, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalsCollectionViewCell", for: indexPath) as! AnimalsCollectionViewCell
//        cell.animalListCallBack = {
//
//        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AnimalsListController") as! AnimalsListController
        vc.animalsList = zooList[indexPath.item].animal ?? []
//        vc.zooInfo = zooList[indexPath.item].about
        navigationController?.show(vc, sender: nil)
    }
    
    @IBAction func gridButton(_ sender: Any) {
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            CGSize(width: 50, height: 50)
//        }
//        zooListCollectionView.reloadData()
    }
    
    
}
