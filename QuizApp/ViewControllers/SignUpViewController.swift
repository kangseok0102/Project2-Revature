//
//  SignUpViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var UsernameTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var ConfirmTxt: UITextField!
    @IBOutlet weak var SignUpBttn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let emailImage = UIImage(named: "EmailIcon")
        addLeftImageTo(txtField: UsernameTxt, andImage: emailImage!)
        let PasswordImage = UIImage(named: "PasswordIcon")
        addLeftImageTo(txtField: PasswordTxt, andImage: PasswordImage!)
        let ConfirmImage = UIImage(named: "PasswordConfirmIcon")
        addLeftImageTo(txtField: ConfirmTxt, andImage: ConfirmImage!)
        
        UsernameTxt.TextBoxDesign()
        PasswordTxt.TextBoxDesign()
        ConfirmTxt.TextBoxDesign()
        SignUpBttn.BttnDesign()
        
 
    }

    private func addLeftImageTo(txtField: UITextField, andImage img:UIImage){
        
        let leftImageView = UIImageView(frame: CGRect(x:0.0, y:0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
        
    }

    @IBAction func SignUpBttn(_ sender: Any) {
        
        let MovePage = UIAlertController(title: "Success!", message: "You Successfully Signed Up", preferredStyle: UIAlertController.Style.alert)
        let InvalidInfo = UIAlertController(title: "Password Does Not Match", message: "Please Enter Identical Password", preferredStyle: UIAlertController.Style.alert)
        let RetryAlert = UIAlertController(title: "Invalid Information", message: "Please Enter All Required Fields", preferredStyle: UIAlertController.Style.alert)
        
        if(PasswordTxt.text != ConfirmTxt.text){
            
            InvalidInfo.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(InvalidInfo, animated: true, completion: nil)
            
        } else if (UsernameTxt.text == "" || PasswordTxt.text == "" || ConfirmTxt.text == ""){
            RetryAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(RetryAlert, animated: true, completion: nil)
        }
        else{
            let dictionary = ["username": UsernameTxt.text, "password": PasswordTxt.text]
            DatabaseHelper.inst.saveNewUser(object: dictionary as! [String : String])
            MovePage.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(MovePage, animated: true, completion: nil)
            
        }
        
        UsernameTxt.text = ""
        PasswordTxt.text = ""
        ConfirmTxt.text = ""
    
        
    }
    

    @IBAction func SignInBttn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "LogInPage") as! LogInViewController
            present(vc, animated: true)
            vc.modalPresentationStyle = .fullScreen
 
        
    }

}
