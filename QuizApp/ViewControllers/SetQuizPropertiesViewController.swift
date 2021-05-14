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
    var qvc = SetQuizPropertiesViewController.self
    static var numOfQuestionsOnNewQuiz: Int64?
    static var categoryName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressButton(_ sender: Any) {
        qvc.numOfQuestionsOnNewQuiz = Int64(numTextField.text!)
        qvc.categoryName = categoryNameTextField.text!
        let sBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let testPage = sBoard.instantiateViewController(identifier: "TestCreator") as! TestCreatorViewController
        present(testPage, animated: true, completion: nil)
        print("Making \(SetQuizPropertiesViewController.numOfQuestionsOnNewQuiz!) questions")
    }
    

}
