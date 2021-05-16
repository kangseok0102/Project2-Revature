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
    
    var categories : [Category] = []
    var categoryCreationData : [String : Bool] = [:]
    
    var QImg = ["JavaImg", "PythonImg", "SwiftImg"]
    var QIcon = ["Java", "Python", "Swift"]
    var QLabel = ["Jave Quiz", "Python Quiz", "Swift Quiz"]
    var QDes = ["Select Java Quiz", "Select Python Quiz", "Select Swift Quiz"]
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        var index : Int
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! QuizCollectionViewCell
        let categoryName = categories[indexPath.row].category
        if (QIcon.contains(categoryName)) {
            index = QIcon.firstIndex(of: categoryName)
        }
        
        cell.QuizImg.image = UIImage(named: QImg[index])
        cell.QuizIcon.image = UIImage(named: QIcon[index])
        cell.QuizCt.text = QLabel[index]
        cell.QuizDp.text = QDes[index]
       
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
                categoryCreationData.updateValue(true, forKey: category.name)
            }
        }
        newQuizNotificationLabel.isHidden = false
    }
    
  

}

