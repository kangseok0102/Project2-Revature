//
//  MenuViewController_Admin.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/14/21.
//

import UIKit
import SideMenu

class MenuViewController_Admin: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var CreateQuizBttn: UIButton!
    
    
    var menu: SideMenuNavigationController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreateQuizBttn.BttnDesign()
        menu = SideMenuNavigationController(rootViewController: AdminMenuTableViewController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
    }

    @IBAction func didTap(_ sender: Any) {
    
        present(menu!, animated: true)
    
    }
    
        
        
   
    

    var QLabel = ["Jave Quiz", "Python Quiz", "Swift Quiz", "SQL Quiz"]
    var QImage = ["JavaImg_Admin", "PythonImg_Admin", "SwiftImg_Admin", "SQLImg_Admin"]
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return QLabel.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell_Admin", for: indexPath) as! AdminCollectionViewCell
        
        cell.QImg_Admin.image = UIImage(named: QImage[indexPath.row])
        cell.QLabel_Amin.text = QLabel[indexPath.row]
        
        switch indexPath.item{
        case 0:
            cell.CellView.backgroundColor = UIColor(red: 63/255.0, green: 71/250.0, blue: 80/250.0, alpha: 0.8)
        case 1:
              cell.CellView.backgroundColor = UIColor(red: 223/255.0, green: 133/250.0, blue: 91/250.0, alpha: 0.8)
        case 2:
            cell.CellView.backgroundColor = UIColor(red: 33/255.0, green: 21/2550.0, blue: 33/250.0, alpha: 0.3)
        case 3:
            cell.CellView.backgroundColor = UIColor(red: 157/255.0, green: 177/2550.0, blue: 92/250.0, alpha: 0.5)
        default:
            print("")
        
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: 400)
    }

    
}


