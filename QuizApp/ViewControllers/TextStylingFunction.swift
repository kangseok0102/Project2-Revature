//
//  TextStylingFunction.swift
//  QuizApp
//
//  Created by Kangseok Lee on 5/16/21.
//

import Foundation
import UIKit


/*
    Label, TextField, Button shadow design
 */

extension UILabel{
    
    func LabelDesign(){
        
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
}

extension UITextField{
    
    func TextBoxDesign(){
        
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
    
}

extension UIButton{
    
    func BttnDesign(){
        
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
    
}
