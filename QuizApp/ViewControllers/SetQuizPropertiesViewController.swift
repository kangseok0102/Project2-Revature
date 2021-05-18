//
//  SetQuizPropertiesViewController.swift
//  QuizApp
//
//  Created by Edward Guilllermo on 5/14/21.
//

import UIKit

class SetQuizPropertiesViewController: UIViewController {

    @IBOutlet weak var categoryNameTextField: UITextField!
    @IBOutlet weak var numTextField: UITextField!
    static var numOfQuestionsOnNewQuiz: Int64?
    static var categoryName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressButton(_ sender: Any) {
        SetQuizPropertiesViewController.numOfQuestionsOnNewQuiz = Int64(numTextField.text!)
        SetQuizPropertiesViewController.categoryName = categoryNameTextField.text!
        let sBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let testPage = sBoard.instantiateViewController(identifier: "TestCreator") as! TestCreatorViewController
        present(testPage, animated: true, completion: nil)
        print("I AM HERE")
        print("Number of Questions: \(SetQuizPropertiesViewController.numOfQuestionsOnNewQuiz!)")
        print("Category Name: \(SetQuizPropertiesViewController.categoryName!)")
        print("Making \(SetQuizPropertiesViewController.numOfQuestionsOnNewQuiz!) questions")
    }
    

}
