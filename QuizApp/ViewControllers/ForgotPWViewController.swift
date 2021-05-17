//
//  ForgotPWViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit

class ForgotPWViewController: UIViewController {
    
    let alertUsername = UIAlertController(title: "Invalid Username", message: "We're sorry, we can't find that username, please try again", preferredStyle: .alert)
    let invalidPasswordAlert = UIAlertController(title: "Invalid Password", message: "Please enter a valid password", preferredStyle: .alert)
    let passwordDialog = UIAlertController(title: "Reset Password", message: "Please enter your new password below", preferredStyle: .alert)
    var username = ""
    
    @IBOutlet weak var usernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordDialog.addTextField { (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        passwordDialog.addAction(UIAlertAction(title: "Continue", style: .default) {[self, weak passwordDialog] _ in
            guard let textfield = passwordDialog?.textFields?[0] else { return }
            let passwordText = textfield.text
                let user = DatabaseHelper.inst.fetchUserSpecifiedData(username: username)
                if user.password == passwordText{
                self.presentingViewController?.dismiss(animated: false, completion: nil)
            } else {
                self.dismiss(animated: false, completion: nil)
                self.present(invalidPasswordAlert, animated: false)
                
            }
            
        })
        invalidPasswordAlert.addTextField { (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        invalidPasswordAlert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { [self, weak invalidPasswordAlert] _ in
            guard let textfield = invalidPasswordAlert?.textFields?[0] else { return }
            let passwordText = textfield.text
            let user = DatabaseHelper.inst.fetchUserSpecifiedData(username: username)
            if user.password == passwordText{
                self.presentingViewController?.dismiss(animated: false, completion: nil)
                
            } else {
                self.dismiss(animated: false)
                self.present(self.invalidPasswordAlert, animated: false)
            }
        }))
        
    }
    
    @IBAction func submit(_ sender: Any) {
        
        let user = DatabaseHelper.inst.fetchUserSpecifiedData(username: username)
        if (user.username != nil) {
            username = user.username!
            self.present(passwordDialog, animated: false)
        } else {
            self.present(alertUsername, animated: false)
        }
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
