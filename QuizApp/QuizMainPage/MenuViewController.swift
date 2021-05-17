//
//  MenuViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit
import SideMenu

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    //@IBOutlet weak var newQuizNotificationLabel: UILabel!
    var categories : [Categories] = DatabaseHelper.inst.fetchAllCategoriesData()
    var categoryCreationData : [String : Bool] = [:]

    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        menu = SideMenuNavigationController(rootViewController: UserMenuTableViewController())

        setupView()
    }
    
    func setupView() {
        for i in 0 ..< QuizIcon.count {
            categoryCreationData.updateValue(false, forKey: QuizIcon[i])
        }
        //newQuizNotificationLabel.isHidden = true
        menu = SideMenuNavigationController(rootViewController: UserMenuTableViewController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        NotificationCenter.default.addObserver(self, selector: #selector(update(_ :)), name:Notification.Name("NewQuizCreated"), object: nil)
    }
    
     
    @IBAction func didTap(_ sender: Any) {
        present(menu!, animated: true)
    }
    
    var QuizImg = ["JavaImg", "PythonImg", "SwiftImg", "SQLImg"]
    var QuizIcon = ["Java", "Python", "Swift", "Sql"]
    var QuizCt = ["Jave Quiz", "Python Quiz", "Swift Quiz", "SQL Quiz"]
    var QuizDp = ["You can test your Java skills with this quiz", "You can test your Python skills with this quiz", "You can test your Swift skills with this quiz", "You can test your SQL skills with this quiz"]
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var index = QuizImg.count
        var i = 0
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! QuizCollectionViewCell
        let categoryName = categories[indexPath.row].name
        if (QuizIcon.contains(categoryName!)) {
            index = QuizIcon.firstIndex(of: categoryName!)!
        }
        while i < index {
            cell.QuizImg.image = UIImage(named: QuizImg[i])
            cell.QuizIcon.image = UIImage(named: QuizIcon[i])
            cell.QuizCt.text = QuizCt[i]
            cell.QuizDp.text = QuizDp[i]
            i += 1
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 400)
    }

    @objc func update(_ notif: Notification) {
        categories = DatabaseHelper.inst.fetchAllCategoriesData()
        let msg = notif.object as? String
        for category in categories {
            if (category.name == msg) {
                categoryCreationData.updateValue(true, forKey: category.name!)
            }
        }
        //newQuizNotificationLabel.isHidden = false
    }
}


