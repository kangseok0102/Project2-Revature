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
    var mvc = MenuViewController.self
    static var categoryName: String?
    static var arrOfUniqueCategoryNames: [String] = []
    
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
    
    var QuizImg = ["JavaImg", "PythonImg", "SwiftImg", "SQLImg", "AndroidImg"]
    var QuizIcon = ["Java", "Python", "Swift", "Sql","AndroidIcon"]
    var QuizCt = ["Java Quiz", "Python Quiz", "Swift Quiz", "SQL Quiz", "Android Quiz"]
    var QuizDp = ["You can test your Java skills with this quiz", "You can test your Python skills with this quiz", "You can test your Swift skills with this quiz", "You can test your SQL skills with this quiz", "You can test your Android skills with this quiz"]
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getUniqueCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var index = QuizImg.count
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! QuizCollectionViewCell
        let uniqueCategories = categories.unique{$0.name}
        let categoryName = uniqueCategories[indexPath.row].name
        if (QuizIcon.contains(categoryName!)) {
            index = QuizIcon.firstIndex(of: categoryName!)!
        }
        cell.QuizImg.image = UIImage(named: QuizImg[indexPath.row])
        cell.QuizIcon.image = UIImage(named: QuizIcon[indexPath.row])
        cell.QuizCt.text = QuizCt[indexPath.row]
        cell.QuizDp.text = QuizDp[indexPath.row]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(mvc.arrOfUniqueCategoryNames)
        mvc.categoryName = mvc.arrOfUniqueCategoryNames[indexPath.row]
        print("Category Name Saved is: \(mvc.categoryName)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let quizVC = storyboard.instantiateViewController(identifier: "quiz")
        present(quizVC, animated: true)
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
    
    func getUniqueCount() -> Int {
        let categoryData = DatabaseHelper.inst.fetchAllCategoriesData()
        var arrCategory: [String] = []
        var uniqueData: [String] = []
        
        for c in categoryData {
            arrCategory.append(c.name!)
        }
        uniqueData = arrCategory.uniqued()
        
        MenuViewController.arrOfUniqueCategoryNames = uniqueData //Set static var for quizviewcontroller
        return uniqueData.count
    }
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

extension Array {
    func unique<T:Hashable>(map: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>() //the unique list kept in a Set for fast retrieval
        var arrayOrdered = [Element]() //keeping the unique list of elements but ordered
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }

        return arrayOrdered
    }
}
