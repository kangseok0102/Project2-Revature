//
//  CreateQuizViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/15/21.
//

import UIKit
import Foundation


class CreateQuizViewController: UIViewController {
    
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var numOfQuestionTextField: UITextField!
    var cqvc = CreateQuizViewController.self
    static var numOfQuestionsOnNewQuiz: Int64?
    static var categoryName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setQuizProperties(_ sender: Any) {
        cqvc.numOfQuestionsOnNewQuiz = Int64(numOfQuestionTextField.text!)
        cqvc.categoryName = categoryTextField.text!
        let sBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let createQuizPage = sBoard.instantiateViewController(identifier: "createQuiz") as! TestCreatorViewController
        present(createQuizPage, animated: true, completion: nil)
        print("I AM HERE IN SET QUIZ PROPERTIES")
        print("Number of Questions: \(CreateQuizViewController.numOfQuestionsOnNewQuiz!)")
        print("Category Name: \(CreateQuizViewController.categoryName!)")
        //print("Making \(cqvc.numOfQuestionsOnNewQuiz!) questions")
    }
}
