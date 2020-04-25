//
//  PlusButtonView.swift
//  MyToDoSlideApp
//
//  Created by Kato Ryota  on 24/04/20.
//  Copyright © 2020 Kato Ryota . All rights reserved.
//
import UIKit

class ButtonView{
    
    
    func PlusButtonView() -> UIButton{
        let button:UIButton = UIButton()
        button.backgroundColor = .white
        button.setTitle("項目を追加する", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1.0
        return button
 
    }
    
}
