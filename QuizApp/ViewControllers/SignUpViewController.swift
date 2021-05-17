//
//  SignUpViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var ConfirmTxt: UITextField!
    @IBOutlet weak var SignUpBttn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let emailImage = UIImage(named: "EmailIcon")
        addLeftImageTo(txtField: EmailTxt, andImage: emailImage!)
        let PasswordImage = UIImage(named: "PasswordIcon")
        addLeftImageTo(txtField: PasswordTxt, andImage: PasswordImage!)
        let ConfirmImage = UIImage(named: "PasswordConfirmIcon")
        addLeftImageTo(txtField: ConfirmTxt, andImage: ConfirmImage!)
        
        EmailTxt.TextBoxDesign()
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
    

}
