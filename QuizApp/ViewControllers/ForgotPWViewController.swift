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
    
    
    //Function to add image to the left side of textfield
    private func addLeftImageTo(txtField: UITextField, andImage img:UIImage){
        
        let leftImageView = UIImageView(frame: CGRect(x:0.0, y:0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
        
    }
    

}
