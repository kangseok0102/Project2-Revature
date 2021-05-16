//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Edward Guilllermo on 5/12/21.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTableView: UITableView!
    //let data = DatabaseHelper.inst.fetchAllQuestionData()
    let categoryData = DatabaseHelper.inst.fetchAllCategoriesData()
    var quizQuestions = [Question]()
    var currentQuestion: Question?
    var currentCategory = TestingViewController.categoryName
    var currentPoints: Int64 = 0
    var totalCountOfQuestions: Int64 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = currentCategory
        answerTableView.delegate = self
        answerTableView.dataSource = self
        setupQuestions()
        getTotalCountOfQuestions()
        configureUI(question: quizQuestions.first!)
    }
    
    func getTotalCountOfQuestions() {
        totalCountOfQuestions = Int64(quizQuestions.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.choice.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listChoice", for: indexPath)
        cell.textLabel?.text = currentQuestion?.choice[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let question = currentQuestion else {
            return
        }
        let answer = question.choice[indexPath.row]
        if let index = quizQuestions.firstIndex(where: { $0.text == question.text }) {
            if index < (quizQuestions.count - 1) {
                checkAnswer(answer: answer, question: question)
                let nextQuestion = quizQuestions[index + 1]
                configureUI(question: nextQuestion)
                answerTableView.reloadData()
            }
            else {
                print("INSIDE ELSE BLOCK")
                checkAnswer(answer: answer, question: question)
                print("Username: \(TestingViewController.username)")
                print("Current Points: \(currentPoints)")
                print("Total Points: \(totalCountOfQuestions)")
                DatabaseHelper.inst.saveQuizScore(username: TestingViewController.username, countOfCorrectAnswers: currentPoints, countOfQuestions: totalCountOfQuestions)
                print("I SHOULD HAVE SAVED THE SCORES")
                let sBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let testPage = sBoard.instantiateViewController(identifier: "TestingView") as! TestingViewController
                present(testPage, animated: true, completion: nil)
                print("Quiz Finished, going back to Testing Screen")
            }
        }
    }
    
    func checkAnswer(answer: Choice, question: Question) {
        if question.choice.contains(where: { $0.text == answer.text }) && answer.isCorrect {
            currentPoints += 1
        }
    }
    
    private func configureUI(question: Question) {
        questionLabel.text = question.text
        currentQuestion = question
        answerTableView.reloadData()
    }
    
    private func setupQuestions() {
        for q in categoryData {
            if (q.name == currentCategory) {
                quizQuestions.append(Question(text: (q.categories?.questionText!)!, choice: [
                    Choice(text: (q.categories?.choices?.choiceText![0])!, isCorrect: (q.categories?.choices?.isCorrect![0])!),
                    Choice(text: (q.categories?.choices?.choiceText![1])!, isCorrect: (q.categories?.choices?.isCorrect![1])!),
                    Choice(text: (q.categories?.choices?.choiceText![2])!, isCorrect: (q.categories?.choices?.isCorrect![2])!),
                    Choice(text: (q.categories?.choices?.choiceText![3])!, isCorrect: (q.categories?.choices?.isCorrect![3])!)
                ]))
            }
        }
    }
    
}

struct Question {
    var text: String
    let choice: [Choice]
}

struct Choice {
    let text: String
    let isCorrect: Bool
}
