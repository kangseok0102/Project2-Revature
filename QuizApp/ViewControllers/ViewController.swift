//
//  ViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/11/21.
//

import UIKit
import MBCircularProgressBar

class ViewController: UIViewController {

    @IBOutlet weak var CircleView: MBCircularProgressBarView!
    @IBOutlet weak var QuizLB: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CircleView.value = 0
        navigationController?.isNavigationBarHidden = true
        
        UIView.transition(with: self.QuizLB, duration: 1.5, options: .transitionCrossDissolve, animations: {self.QuizLB.isHidden = false}, completion: {finised in
        
            self.CircleAnimation()
        
        })
        
        
    }
    
    fileprivate func CircleAnimation(){
    
        UIView.animate(withDuration: 2.5, animations: {self.CircleView.value = 100}, completion: {finished in
            let vc = self.storyboard?.instantiateViewController(identifier: "LogInPage") as! LogInViewController
            self.present(vc, animated: true)
        })
    
    }

}

