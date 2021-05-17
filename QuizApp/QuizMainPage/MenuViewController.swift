//
//  MenuViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit
import SideMenu

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var newQuizNotificationLabel: UILabel!
    var categories : [Categories] = DatabaseHelper.inst.fetchAllCategoriesData()
    var categoryCreationData : [String : Bool] = [:]
    //Make these variables dynamic
    var QImg = ["JavaImg", "PythonImg", "SwiftImg"] //No attribute in Category
    var QIcon = ["Java", "Python", "Swift"] //No attribute in Category
    var QLabel = ["Java Quiz", "Python Quiz", "Swift Quiz"] //Has attribute in Category
    var QDes = ["Select Java Quiz", "Select Python Quiz", "Select Swift Quiz"] //Has attribute in Category
    //
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        for i in 0 ..< QIcon.count {
            categoryCreationData.updateValue(false, forKey: QIcon[i])
        }
        newQuizNotificationLabel.isHidden = true
        menu = SideMenuNavigationController(rootViewController: MenuTableViewController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        NotificationCenter.default.addObserver(self, selector: #selector(update(_ :)), name:Notification.Name("NewQuizCreated"), object: nil)
    }
     
    @IBAction func didTap(_ sender: Any) {
        present(menu!, animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var index = QImg.count
        var i = 0
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! QuizCollectionViewCell
        let categoryName = categories[indexPath.row].name
        if (QIcon.contains(categoryName!)) {
            index = QIcon.firstIndex(of: categoryName!)!
        }
        while i < index {
            cell.QuizImg.image = UIImage(named: QImg[i])
            cell.QuizIcon.image = UIImage(named: QIcon[i])
            cell.QuizCt.text = QLabel[i]
            cell.QuizDp.text = QDes[i]
            i += 1
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 400)
    }

    @objc func update(_ notif: Notification){
        categories = DatabaseHelper.inst.fetchAllCategoriesData()
        let msg = notif.object as? String
        for category in categories {
            if (category.name == msg) {
                categoryCreationData.updateValue(true, forKey: category.name!)
            }
        }
        newQuizNotificationLabel.isHidden = false
    }
}

