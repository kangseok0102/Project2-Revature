//
//  SignUpViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var repeatPasswordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        let dictionary = ["username": usernameField.text, "password": passwordField.text]
        DatabaseHelper.inst.saveNewUser(object: dictionary as! [String : String])
        let vc = self.storyboard?.instantiateViewController(identifier: "login") as! LogInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signInLink(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "login") as! LogInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
