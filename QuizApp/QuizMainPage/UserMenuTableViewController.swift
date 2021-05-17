//
//  MenuTableViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit

class UserMenuTableViewController: UITableViewController {
    
    
    var SideMenuData = ["  Ranking","User Feedback", "  Log Out"]
    var SideMenuImage = ["RankingIcon","FeedbackIcon", "LogOutIcon"]
    
    private let color = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.backgroundColor = color
        view.backgroundColor = color
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
                
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SideMenuData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = color
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = SideMenuData[indexPath.row]
        cell.imageView?.image = UIImage(named: SideMenuImage[indexPath.row])
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch indexPath.item {
        case 0:
            let RankingVC = storyboard.instantiateViewController(identifier: "rank") as!
                RankingTableViewController
                present(RankingVC, animated: true)
                RankingVC.modalPresentationStyle = .fullScreen
        case 1:
            let FeedbackVC = storyboard.instantiateViewController(identifier: "feedback") as! FeedbackViewController
                present(FeedbackVC, animated: true)
                FeedbackVC.modalPresentationStyle = .fullScreen
        case 2:
            LogInViewController.loginManager.logOut()
            let LogInVC = storyboard.instantiateViewController(identifier: "LogInPage") as! LogInViewController
                present(LogInVC, animated: true)
                LogInVC.modalPresentationStyle = .fullScreen
        default:
            print("")
        }
        
    }
    
            
}
