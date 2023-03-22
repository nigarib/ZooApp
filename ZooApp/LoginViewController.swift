//
//  LoginViewController.swift
//  ZooApp
//
//  Created by Nigar on 14.03.23.
//

import UIKit

class LoginViewController: UIViewController {
//    func setText(user: User) {
//        print("text: \(user)")
//        emailOutlet.text = user.email
//        passwordOutlet.text = user.password
//    }
    

    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginButton(_ sender: Any) {
        if let email = emailOutlet.text, let password = passwordOutlet.text, !email.isEmpty, !password.isEmpty {
            if password.count >= 5 && password.count <= 10 {
                let vc = storyboard?.instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
                navigationController?.show(vc, sender: nil)
            } else {
                print("Sifre yalnisdir")
            }
        } else {
            print("Melumatlar duzgun deyil")
        }
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        let regisController = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
//        regisController.delegate = self
        navigationController?.show(regisController, sender: nil)
    }
    
}
