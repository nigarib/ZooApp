//
//  ViewController.swift
//  ZooApp
//
//  Created by Nigar on 04.03.23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var slides = [OnboardItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOutlet.layer.cornerRadius = 10
        onboardJsonRead()
            }
    
    func onboardJsonRead() {
        if let jsonFile = Bundle.main.url(forResource: "Onboard", withExtension: "json"),
           let data = try? Data(contentsOf: jsonFile) {
            do {
                slides = try JSONDecoder().decode([OnboardItems].self, from: data)
                collectionView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File not found")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardCollectionViewCell", for: indexPath) as! OnboardCollectionViewCell
        cell.slideImage.image = UIImage(named: slides[indexPath.item].image)
        cell.welcomeLabel.text = slides[indexPath.item].label
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    @IBAction func button(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
        navigationController?.show(vc, sender: nil)
        
        
    }
    
}

