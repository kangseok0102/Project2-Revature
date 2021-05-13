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
        
        //cell.rankingLabel.text =

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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
