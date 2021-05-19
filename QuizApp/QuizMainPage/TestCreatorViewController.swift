//
//  TestCreatorViewController.swift
//  QuizApp
//
//  Created by Edward Guilllermo on 5/17/21.
//

import UIKit

class TestCreatorViewController: UIViewController {

    @IBOutlet weak var RegisterBttn: UIButton!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var choiceATextField: UITextField!
    @IBOutlet weak var choiceBTextField: UITextField!
    @IBOutlet weak var choiceCTextField: UITextField!
    @IBOutlet weak var choiceDTextField: UITextField!
    @IBOutlet weak var switchA: UISwitch!
    @IBOutlet weak var switchB: UISwitch!
    @IBOutlet weak var switchC: UISwitch!
    @IBOutlet weak var switchD: UISwitch!
    @IBOutlet weak var statusLabel: UILabel!
    var valueSwitchA: Bool = false
    var valueSwitchB: Bool = false
    var valueSwitchC: Bool = false
    var valueSwitchD: Bool = false
    var isOnCounter: Int = 0
    var currentStatus: Int = 1
    let total = CreateQuizViewController.numOfQuestionsOnNewQuiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStatusLabel()
        RegisterBttn.BttnDesign()
        questionTextField.TextBoxDesign()
        choiceATextField.TextBoxDesign()
        choiceBTextField.TextBoxDesign()
        choiceCTextField.TextBoxDesign()
        choiceDTextField.TextBoxDesign()
    }

    func setStatusLabel() {
        statusLabel.text = "\(currentStatus)/\(total)"
    }
    
    func resetValues() {
        questionTextField.text = ""
        choiceATextField.text = ""
        choiceBTextField.text = ""
        choiceCTextField.text = ""
        choiceDTextField.text = ""
        valueSwitchA = false
        valueSwitchB = false
        valueSwitchC = false
        valueSwitchD = false
        isOnCounter = 0
    }
    
    func checkSwitchStatus() {
        if switchA.isOn {
            isOnCounter += 1
            valueSwitchA = true
        }
        if switchB.isOn {
            isOnCounter += 1
            valueSwitchB = true
        }
        if switchC.isOn {
            isOnCounter += 1
            valueSwitchC = true
        }
        if switchD.isOn {
            isOnCounter += 1
            valueSwitchD = true
        }
    }
    
    @IBAction func registerQuestionAndChoicesButton(_ sender: Any) {
        let questionText = questionTextField.text!
        var choiceArray: [String] = []
        var boolArray: [Bool] = []
        
        checkSwitchStatus()
        if ((questionTextField.text != "" || choiceATextField.text != "" || choiceBTextField.text != "" || choiceCTextField.text != "" || choiceDTextField.text != "") && isOnCounter == 1) {
            choiceArray.append(choiceATextField.text!)
            choiceArray.append(choiceBTextField.text!)
            choiceArray.append(choiceCTextField.text!)
            choiceArray.append(choiceDTextField.text!)
            boolArray.append(valueSwitchA)
            boolArray.append(valueSwitchB)
            boolArray.append(valueSwitchC)
            boolArray.append(valueSwitchD)
            DatabaseHelper.inst.saveQuestionAndChoices(question: questionText, listOfChoices: choiceArray, listOfBool: boolArray)
            currentStatus += 1
            setStatusLabel()
        }
        resetValues()
        
        if (currentStatus > total) {
            let sBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let adminPage = sBoard.instantiateViewController(identifier: "Admin") as! MenuViewController_Admin
            present(adminPage, animated: true, completion: nil)
            print("Quiz Creation Done")
        }
    }
}
