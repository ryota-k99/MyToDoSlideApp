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
        button.backgroundColor = .black
        button.setTitle("sample", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        
        return button
 
    }
    
}
