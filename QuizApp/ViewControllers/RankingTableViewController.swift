//
//  RankingTableViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit

class RankingTableViewController: UITableViewController {
    @IBOutlet weak var table: UITableView!
    
    var categories : [Category] = []
    
    var rankedUsersByCategory : [String : [User]] = [:]
    
    var thirtyDays = 30 * 86400
    var twentyDays = 20 * 86400
    var tenDays = 10 * 86400

    @IBOutlet weak var message: UILabel!
     
    override func viewDidLoad() {
        
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        for category in categories {
            let sortedUsers = sortUsersAccordingToRank(DBHelper.inst.getUsersWithScoresInCategory(category), inCategory: category)
            rankedUsersByCategory.updateValue(sortedUsers, forKey: category.name)
            
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return categories.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankTableViewCell
        let categoryName = categories[indexPath.section].name
        cell.rankingLabel.text = String(indexPath.row + 1)
        cell.usernameLabel.text = rankedUsersByCategory[categoryName][indexPath.row].username
        cell.scoreLabel.text = rankedUsersByCategory[categoryName][indexPath.row].avgScores[categoryName]
        
        switch cell.rankingLabel.text {
        case "1":
            message.text = "Congratulations!  You earned a 30 day subscription!"
            print("get 30 days free")
            user.isSubscribed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + thirtyDays){
                user.isSubscribed = false
            }
        case "2":
            message.text = "Congratulations!  You earned a 20 day subscription!"
            print("get 20 days free")
            user.isSubscribed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + twentyDays){
                    user.isSubscribed = false
                }
       case "3":
            message.text = "Congratulations!  You earned a 10 day subscription!"
            print("get 10 days free")
            user.isSubscribed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + tenDays){
                user.isSubscribed = false
            }
        default:
           print("")
    }


        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].name
    }
    
    func sortUsersAccordingToRank(_ users: [User], inCategory category: Category) -> [User] {
        let categoryName = category.name
        users.sort {
            return ($0.rankings[categoryName] < $1.rankings[categoryName])
        }
    }
    


}
