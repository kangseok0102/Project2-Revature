//
//  AdminMenuTableViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/15/21.
//



import UIKit

class AdminMenuTableViewController: UITableViewController {
    
    
    var AdminSideMenuData = ["User List", "Feedback List", "  Log Out"]
    var AdminSideMenuImage = ["UserListIcon", "FeedbackIcon", "LogOutIcon"]
    
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
        return AdminSideMenuData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = color
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = AdminSideMenuData[indexPath.row]
        cell.imageView?.image = UIImage(named: AdminSideMenuImage[indexPath.row])
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch indexPath.item {
        case 0:
            let UserListVC = storyboard.instantiateViewController(identifier: "userlist") as! UserListTableViewController
                UserListVC.modalPresentationStyle = .fullScreen
                present(UserListVC, animated: true)
        case 1:
            let FeedbackListVC = storyboard.instantiateViewController(identifier: "feedbacklist") as! UserFeedbackTableViewController
                FeedbackListVC.modalPresentationStyle = .fullScreen
<<<<<<< HEAD
        case 2:
            LogInViewController.loginManager.logOut()
            let LogInVC = storyboard.instantiateViewController(identifier: "LogInPage") as! LogInViewController
                present(LogInVC, animated: true)
                LogInVC.modalPresentationStyle = .fullScreen
=======
                present(FeedbackListVC, animated: true)
>>>>>>> origin/main
        default:
            print("")
        }
    }
            
}
