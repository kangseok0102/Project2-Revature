//
//  LogInViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit

class LogInViewController: UIViewController {

    let alertUsername = UIAlertController(title: "Invalid Username", message: "We're sorry, we can't find that username, please try again", preferredStyle: .alert)
    let alertLogin = UIAlertController(title: "Invalid Login Credentials", message: "Invalid login credentials, please try again", preferredStyle: .alert)
    
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertUsername.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alertLogin.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(identifier: "home")
        homeVC.modalPresentationStyle = .fullScreen
        let isValidated = authenticate(username: usernameField.text, password: passwordField.text)
        if (isValidated){
            self.present(homeVC, animated: false)
        } else {
            self.present(alertLogin, animated: true)
        }
    }
    @IBAction func forgotPass(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let forgotPassVC = storyboard.instantiateViewController(identifier: "forgotPass")
        forgotPassVC.modalPresentationStyle = .fullScreen
        let user = DatabaseHelper.inst.fetchUserSpecifiedData(username: usernameField.text)
        if (user.username == usernameField.text) {
            self.present(forgotPassVC, animated: false)
        } else {
            self.present(alertUsername, animated: true)
        }
    }
    
    func authenticate(username: String?, password: String?) -> Bool {
        let user = DatabaseHelper.inst.fetchUserSpecifiedData(username: username)
        if (user.username == username && user.password == password) {
                return true
        }
        return false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
