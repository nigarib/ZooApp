//
//  RegisterViewController.swift
//  ZooApp
//
//  Created by Nigar on 14.03.23.
//

import UIKit
//
//protocol RegisterProtocol {
//    func setText(user: User)
//}

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var birthdate: UITextField!
    @IBOutlet weak var password: UITextField!
    
//    var delegate: RegisterProtocol?
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getFilePath()
    }
    
    func getFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path = docDirectory.appendingPathExtension("Users.json")
        print(path)
        return path
    }
    
    func writeToJsonFile() {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: getFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readDataFromFile() {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                users = try JSONDecoder().decode([User].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File not exist ")
        }
            
    }
    
    @IBAction func registerButton(_ sender: Any) {
        if let fullName = fullname.text,
           let passWord = password.text,
           let birthDate = birthdate.text,
           let phonenumber = phoneNumber.text,
           let email = email.text,
           !fullName.isEmpty, !passWord.isEmpty, !birthDate.isEmpty, !phonenumber.isEmpty, !email.isEmpty {
            if passWord.count >= 5 && passWord.count <= 10 {
//                delegate?.setText(user: .init(fullname: fullName, contactnumber: phonenumber, email: email, password: passWord))
                users.append(.init(fullname: fullName, contactnumber: phonenumber, email: email, password: passWord))
                writeToJsonFile()
                navigationController?.popViewController(animated: true)
                
            } else {
                print("Sifre yalnisdir")
            }
        }
    }
    
    
}
