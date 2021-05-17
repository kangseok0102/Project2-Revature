//
//  CreateQuizViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/15/21.
//

import UIKit
import Foundation


class QuizPageViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    
    @IBAction func choice1(_ sender: Any) {
        
        // choice1.text = DBHelper.inst.FUNCTIONNAME(QUESTIONNUMBER.ANSWER : CHOICE1)
        // if last question{instantiate different VC} else{
        // load next question}
        // question.text = DBHelper.inst.Questionnumber + 1
        // if question.choices.isCorrect = true {
       //     user.score ++
    //  }
    }
        
    @IBAction func choice2(_ sender: Any) {
        
        // choice2.text = DBHelper.inst.FUNCTIONNAME(QUESTIONNUMBER.ANSWER : CHOICE2)
        // if last question{instantiate different VC} else{
        // load next question}
        // question.text = DBHelper.inst.Questionnumber + 1
        // if question.choices.isCorrect = true {
       //     user.score ++
    //  }
    }
    
    @IBAction func choice3(_ sender: Any) {
        
        // choice3.text = DBHelper.inst.FUNCTIONNAME(QUESTIONNUMBER.ANSWER : CHOICE3)
        // if last question{instantiate different VC} else{
        // load next question}
        // question.text = DBHelper.inst.Questionnumber + 1
        // if question.choices.isCorrect = true {
       //     user.score ++
    //  }
    }
    
    
    var timer = Timer()
    let alertTimer = UIAlertController(title: "Out of Time", message: "You are out of time!", preferredStyle: .alert)


    override func viewDidLoad() {
        super.viewDidLoad()
        alertTimer.addAction(UIAlertAction(title: "Out Of Time", style: .default, handler: nil))
        timer = Timer.scheduledTimer(timeInterval: 1800, target: self, selector: #selector(quizEnds), userInfo: nil, repeats: false)

    }
    
    @objc func quizEnds(){
        print("You are out of time")
        view.backgroundColor = UIColor.red
        // submit & update score or otherwise end quiz
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(3.5)) {
            let vc = self.storyboard?.instantiateViewController(identifier: "menu") as! MenuViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
