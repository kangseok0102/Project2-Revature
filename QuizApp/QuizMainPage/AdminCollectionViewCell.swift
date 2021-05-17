//
//  AdminCollectionViewCell.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/14/21.
//

import UIKit

class AdminCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var QImg_Admin: UIImageView!
    @IBOutlet weak var QLabel_Amin: UILabel!
    @IBOutlet weak var CellView: UIView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 5, height: 10)
        
        self.clipsToBounds = false
    }
    
}
