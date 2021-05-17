//
//  ForgotPWViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit

class ForgotPWViewController: UIViewController {


    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var SubmitBttn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let emailImage = UIImage(named: "EmailIcon")
        addLeftImageTo(txtField: PasswordTxt, andImage: emailImage!)
        
        PasswordTxt.TextBoxDesign()
        SubmitBttn.BttnDesign()
        
        
    }
    

    private func addLeftImageTo(txtField: UITextField, andImage img:UIImage){
        
        let leftImageView = UIImageView(frame: CGRect(x:0.0, y:0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
        

    
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
