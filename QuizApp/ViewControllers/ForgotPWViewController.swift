//
//  ForgotPWViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit

class ForgotPWViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var SubmitBttn: UIButton!
    
    
    private func addLeftImageTo(txtField: UITextField, andImage img:UIImage){
        
        let leftImageView = UIImageView(frame: CGRect(x:0.0, y:0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
        
        let alertUsername = UIAlertController(title: "Invalid Username", message: "We're sorry, we can't find that username, please try again", preferredStyle: .alert)
        let passwordDialog = UIAlertController(title: "Reset Password", message: "Please enter your new password below", preferredStyle: .alert)
        var username = ""
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let emailImage = UIImage(named: "EmailIcon")
            addLeftImageTo(txtField: usernameField, andImage: emailImage!)
            
            usernameField.TextBoxDesign()
            SubmitBttn.BttnDesign()
            
            
            passwordDialog.addTextField { (textField) in
                textField.placeholder = "Password"
                textField.isSecureTextEntry = true
            }
            
            passwordDialog.addAction(UIAlertAction(title: "Continue", style: .default) {[self, weak passwordDialog] _ in
                guard let textfield = passwordDialog?.textFields?[0] else { return }
                let passwordText = textfield.text
                let user = DatabaseHelper.inst.fetchUserSpecifiedData(username: username)
                var dic : Dictionary = [String : String]()
                dic.updateValue(username, forKey: "username")
                dic.updateValue(passwordText!, forKey: "password")
                if (passwordText != nil) {
                    DatabaseHelper.inst.updateUserPassword(object: dic)
                    self.presentingViewController?.dismiss(animated: true)
                }
                
            })
            
            alertUsername.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            
        }
        
        
        @IBAction func submit(_ sender: Any) {
            
            let user = DatabaseHelper.inst.fetchUserSpecifiedData(username: usernameField.text!)
            if (user.username != nil) {
                username = user.username!
                self.present(passwordDialog, animated: false)
            } else {
                self.present(alertUsername, animated: false)
            }
        }
        
    }



