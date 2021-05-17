//
//  QuizCollectionViewCell.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/13/21.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var QuizImg: UIImageView!
    @IBOutlet weak var QuizIcon: UIImageView!
    @IBOutlet weak var QuizCt: UILabel!
    @IBOutlet weak var QuizDp: UILabel!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 5, height: 10)
        
        self.clipsToBounds = false
    }
    
    
}
