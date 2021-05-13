//
//  MenuViewController.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/12/21.
//

import UIKit
import SideMenu

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var menu: SideMenuNavigationController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu = SideMenuNavigationController(rootViewController: MenuTableViewController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
    }
     
    @IBAction func didTap(_ sender: Any) {
        
        present(menu!, animated: true)
        
    }
    
    var QImg = ["JavaImg", "PythonImg", "SwiftImg"]
    var QIcon = ["Java", "Python", "Swift"]
    var QLabel = ["Jave Quiz", "Python Quiz", "Swift Quiz"]
    var QDes = ["Select Java Quiz", "Select Python Quiz", "Select Swift Quiz"]
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return QImg.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! QuizCollectionViewCell

        
        cell.QuizImg.image = UIImage(named: QImg[indexPath.row])
        cell.QuizIcon.image = UIImage(named: QIcon[indexPath.row])
        cell.QuizCt.text = QLabel[indexPath.row]
        cell.QuizDp.text = QDes[indexPath.row]
       
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: 400)
    }

    
    
  

}
