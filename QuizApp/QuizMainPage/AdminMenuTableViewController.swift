//
//  AdminMenuTableViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/15/21.
//



import UIKit

class AdminMenuTableViewController: UITableViewController {
    
    
    var AdminSideMenuData = ["User List", "Feedback List"]
    var AdminSideMenuImage = ["UserListIcon", "FeedbackIcon"]
    
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
            let UserListVC = storyboard.instantiateViewController(identifier: "userlist") as!
                UserListTableViewController
                present(UserListVC, animated: true)
                UserListVC.modalPresentationStyle = .fullScreen
        case 1:
            let FeedbackVC = storyboard.instantiateViewController(identifier: "feedback") as! FeedbackViewController
                present(FeedbackVC, animated: true)
                FeedbackVC.modalPresentationStyle = .fullScreen
        default:
            print("")
        }
    }
            
}
