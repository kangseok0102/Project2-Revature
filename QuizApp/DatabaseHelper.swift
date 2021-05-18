//
//  DatabaseHelper.swift
//  QuizApp
//
//  Created by Edward Guilllermo on 5/12/21.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    static var inst = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    static var arrCountOfQuestion = [Int64]()
    static var arrCorrectAnswer = [Int64]()
    static var arrCategory = [String]()
    
    func saveNewUser(object : [String : String]) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!) as! Users
        //let score = NSEntityDescription.insertNewObject(forEntityName: "Scores", into: context!) as! Scores
        user.username = object["username"]
        user.password = object["password"]
        user.ranking = 0
        user.isBlocked = false
        user.isSubscribed = false
        do {
            try context?.save()
            print("Sign Up Successful")
        }
        catch {
            print("Sign Up Failed")
        }
    }
    
    func saveQuestionAndChoices(question: String, listOfChoices: [String], listOfBool: [Bool]) {
        //Method Saves Questions and Answers for a Quiz
        let category = NSEntityDescription.insertNewObject(forEntityName: "Categories", into: context!) as! Categories
        let answers = NSEntityDescription.insertNewObject(forEntityName: "Choices", into: context!) as! Choices
        let questions = NSEntityDescription.insertNewObject(forEntityName: "Questions", into: context!) as! Questions
        answers.choiceText = listOfChoices
        answers.isCorrect = listOfBool
        do{
            try context?.save()
            print("Potential Answers Data saved")
        }
        catch{
            print("Data not saved")
        }
        category.name = CreateQuizViewController.categoryName
        category.totalQuestions = CreateQuizViewController.numOfQuestionsOnNewQuiz!
        questions.questionText = question
        questions.choices = answers
        category.categories = questions
        do {
            try context?.save()
            print("Saving Answer and Choices Successful")
        }
        catch {
            print("Saving Failed")
        }
    }
    
    func saveQuizScore(username: String, countOfCorrectAnswers: Int64, countOfQuestions: Int64) {
        var user = Users()
        let scores = NSEntityDescription.insertNewObject(forEntityName: "Scores", into: context!) as! Scores
        
        if (DatabaseHelper.arrCategory.contains(SetQuizPropertiesViewController.categoryName!)) {
            print("Inside if statement")
            let indexOfCategory = DatabaseHelper.arrCategory.index(of: SetQuizPropertiesViewController.categoryName!)
            DatabaseHelper.arrCorrectAnswer[indexOfCategory!] = countOfCorrectAnswers
        }
        else {
            print("Inside else statement")
            DatabaseHelper.arrCountOfQuestion.append(countOfQuestions)
            DatabaseHelper.arrCorrectAnswer.append(countOfCorrectAnswers)
            DatabaseHelper.arrCategory.append(SetQuizPropertiesViewController.categoryName!)
        }
        scores.correctAnswers = DatabaseHelper.arrCorrectAnswer
        scores.totalQuestions = DatabaseHelper.arrCountOfQuestion
        scores.category = DatabaseHelper.arrCategory
        //scores.correctAnswers = countOfCorrectAnswers
        //scores.totalQuestions = countOfQuestions
        do{
            print(scores.correctAnswers, scores.totalQuestions, scores.category)
            try context?.save()
            print("Score and Total Question Data saved")
        }
        catch{
            print("Data not saved")
        }
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Users")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        do {
            let u = try context?.fetch(fetchReq)
            if (u?.count != 0) {
                user = u?.first as! Users
                //user.userScores?.correctAnswers = countOfCorrectAnswers
                //user.userScores?.totalQuestions = countOfQuestions
                user.userScores = scores
                try context?.save()
                print("Data: Score \(countOfCorrectAnswers)/\(countOfQuestions) Updated")
            }
        }
        catch {
            print("Error")
        }
    }
    
    func fetchAllUserData() -> [Users] {
        var user = [Users]()
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Users")
        do {
            user = try context?.fetch(fetchReq) as! [Users]
            print("Data Fetched")
        }
        catch {
            print("Cannot Fetch Data")
        }
        return user
    }
    
    func fetchAllCategoriesData() -> [Categories] {
        var category = [Categories]()
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Categories")
        do {
            category = try context?.fetch(fetchReq) as! [Categories]
            print("Category Data Fetched")
        }
        catch {
            print("Cannot Fetch Data")
        }
        return category
    }
    
    func fetchAllQuestionData() -> [Questions] {
        var question = [Questions]()
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Questions")
        do {
            question = try context?.fetch(fetchReq) as! [Questions]
            print("Data Fetched")
        }
        catch {
            print("Cannot Fetch Data")
        }
        return question
    }
    
    func fetchUserSpecifiedData (username : String) -> Users {
        var user = Users()
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Users")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        fetchReq.fetchLimit = 1
        do {
            let req = try context?.fetch(fetchReq) as! [Users]
            if(req.count != 0) {
                user = req.first as! Users
            }
            else {
                print("Data not Found")
            }
        }
        catch {
            print("Cannot fetch data")
        }
        return user
    }
    
    func deleteUserSpecifiedData(username: String) {
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Users")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        do {
            let st = try context?.fetch(fetchReq)
            context?.delete(st?.first as! Users)
            try context?.save()
            print("Data Deleted")
        }
        catch {
            print("Data not Deleted")
        }
    }
    
    func fetchAllSubscribedUsers() -> [String] {
        let userData = fetchAllUserData()
        var arrayOfSubscribedUsers: [String] = []
        
        for u in userData {
            if (u.isSubscribed) {
                arrayOfSubscribedUsers.append(u.username!)
            }
        }
        return arrayOfSubscribedUsers
    }
    
    func fetchAllBlockedUsers() -> [String] {
        let userData = fetchAllUserData()
        var arrayOfBlockedUsers: [String] = []
        
        for u in userData {
            if (u.isBlocked) {
                arrayOfBlockedUsers.append(u.username!)
            }
        }
        return arrayOfBlockedUsers
    }
    
    func updateSubStatus(username: String, subStatus: Bool) {
            var user = Users()
            let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Users")
            fetchReq.predicate = NSPredicate(format: "username == %@", username)

            do {
                let u = try context?.fetch(fetchReq)
                if (u?.count != 0) {
                    user = u?.first as! Users
                    user.isSubscribed = !subStatus
                    try context?.save()
                    print("User Subscribed status changed")
                }
            }
            catch {
                print("Error")
            }
        }
}
