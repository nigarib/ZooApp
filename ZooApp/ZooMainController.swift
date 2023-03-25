//
//  ZooMainController.swift
//  ZooApp
//
//  Created by Nigar on 07.03.23.
//

import UIKit

class ZooMainController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var searchOutlet: UISearchBar!
    @IBOutlet weak var zooListCollectionView: UICollectionView!
    
    var zooList = [ZooList]()
    var zooListOriginal = [ZooList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zooListJsonRead()
        searchOutlet.delegate = self
        
    }
    
    func zooListJsonRead() {
        if let jsonFile = Bundle.main.url(forResource: "ZooList", withExtension: "json"),
           let data = try? Data(contentsOf: jsonFile) {
            do {
                zooList = try JSONDecoder().decode([ZooList].self, from: data)
                zooListOriginal = zooList
                zooListCollectionView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File not found")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            zooList = zooListOriginal
        } else {
            zooList = zooListOriginal.filter({ item in
                item.name.contains(searchText)
            })
        }
        zooListCollectionView.reloadData()
    }
//
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
//        login olmayibsa login sehifesine kechsin, olubsa favorite ya da evvelki sehifeye atsin
        cell.favZooCallBack = {
            if UserDefaults.standard.bool(forKey: "loggedIn") {
                print("hi")
            } else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                self.navigationController?.show(vc, sender: nil)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.frame.width / 2 - 10
        print(collectionView.frame.width)
//        print(width)
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AnimalsListController") as! AnimalsListController
        vc.animalsList = zooList[indexPath.item].animal ?? []
        navigationController?.show(vc, sender: nil)
    }
    
    @IBAction func gridButton(_ sender: Any) {
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            CGSize(width: 50, height: 50)
//        }
//        zooListCollectionView.reloadData()
    }
    
    
}
