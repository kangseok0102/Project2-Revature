//
//  SetQuizPropertiesViewController.swift
//  QuizApp
//
//  Created by Edward Guilllermo on 5/14/21.
//

import UIKit

class SetQuizPropertiesViewController: UIViewController {

    @IBOutlet weak var numTextField: UITextField!
    static var numOfQuestionsOnNewQuiz: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressButton(_ sender: Any) {
        SetQuizPropertiesViewController.numOfQuestionsOnNewQuiz = Int(numTextField.text!)
        let sBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let testPage = sBoard.instantiateViewController(identifier: "TestCreator") as! TestCreatorViewController
        present(testPage, animated: true, completion: nil)
        print("Making \(SetQuizPropertiesViewController.numOfQuestionsOnNewQuiz!) questions")
    }
    

}
