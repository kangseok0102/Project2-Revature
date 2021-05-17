//
//  ForgotPWViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit

class ForgotPWViewController: UIViewController {
      
    @IBOutlet weak var emailAddressField: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "login") as! LogInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
