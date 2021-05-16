//
//  QuizPageViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/13/21.
//

import UIKit
import Foundation

class QuizPageViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    
    @IBAction func choice1(_ sender: Any) {
        
        // DBHelper.inst.FUNCTIONNAME(QUESTIONNUMBER.ANSWER : CHOICE1)
        // if last question{instantiate different VC} else{
        // load next question}
        // question.text = DBHelper.inst.Questionnumber + 1
    }
        
    @IBAction func choice2(_ sender: Any) {
        
        // DBHelper.inst.FUNCTIONNAME(QUESTIONNUMBER.ANSWER : CHOICE2)
        // if last question{instantiate different VC} else{
        // load next question}
        // question.text = DBHelper.inst.Questionnumber + 1
    }
    
    @IBAction func choice3(_ sender: Any) {
        
        // DBHelper.inst.FUNCTIONNAME(QUESTIONNUMBER.ANSWER : CHOICE3)
        // if last question{instantiate different VC} else{
        // load next question}
        // question.text = DBHelper.inst.Questionnumber + 1
    }
    
    
    var timer = Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1800, target: self, selector: #selector(quizEnds), userInfo: nil, repeats: false)

    }
    
    @objc func quizEnds(){
        let alertTimer = UIAlertController(title: "Out of Time", message: "You have run out of time.", preferredStyle: .alert)
        alertTimer.addAction(UIAlertAction(title: "Out Of Time", style: .default, handler: nil))
        print("You are out of time")
        view.backgroundColor = UIColor.redColor()
        // submit quiz
        // instantiate different VC
    }
    
}
