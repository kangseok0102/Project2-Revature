//
//  TestingViewController.swift
//  QuizApp
//
//  Created by Edward Guilllermo on 5/12/21.
//

import UIKit

class TestingViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func registerButton(_ sender: Any) {
        let dict = ["username" : userTextField.text, "password" : passTextField.text]
        DatabaseHelper.inst.saveNewUser(object: dict as! [String : String])
        userTextField.text = ""
        passTextField.text = ""
    }
    
    @IBAction func viewAllButton(_ sender: Any) {
        let data = DatabaseHelper.inst.fetchAllUserData()
        for c in data {
            print("Username: \(c.username), Password: \(c.password), Subscribed: \(c.isSubscribed), Blocked: \(c.isBlocked), Ranking: \(c.ranking)")
        }
    }
    
    @IBAction func deleteUserButton(_ sender: Any) {
        DatabaseHelper.inst.deleteUserSpecifiedData(username: userTextField.text!)
    }
    
    @IBAction func viewOneButton(_ sender: Any) {
        let data = DatabaseHelper.inst.fetchUserSpecifiedData(username: userTextField.text!)
        print("Username: \(data.username), Password: \(data.password), Subscribed: \(data.isSubscribed), Blocked: \(data.isBlocked), Ranking: \(data.ranking)")
    }
    
    
    @IBAction func printQuestionsAndAnswers(_ sender: Any) {
        let question = DatabaseHelper.inst.fetchAllQuestionData()
        for q in question {
            print("Question: \(q.questionText!) Choices: \(q.choices?.choiceText!), Bool Values: \(q.choices?.isCorrect!)")
            print(type(of: q.questionText))
            print(type(of: q.choices?.choiceText![0]))
            print(type(of: q.choices?.isCorrect![0]))
            
        }
    }
    
}
