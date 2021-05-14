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
    
    func saveNewUser(object : [String : String]) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!) as! Users
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
        let answers = NSEntityDescription.insertNewObject(forEntityName: "Choices", into: context!) as! Choices
        let questions = NSEntityDescription.insertNewObject(forEntityName: "Questions", into: context!) as! Questions
        answers.choiceText = listOfChoices
        answers.isCorrect = listOfBool
        do{
            try context?.save()
            print("course data saved")
        }
        catch{
            print("data not saved")
        }
        //print(listOfChoices)
        //print(listOfBool)
        questions.questionText = question
        questions.choices = answers
        do {
            try context?.save()
            print("Saving Answer and Choices Successful")
        }
        catch {
            print("Saving Failed")
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
    
}
