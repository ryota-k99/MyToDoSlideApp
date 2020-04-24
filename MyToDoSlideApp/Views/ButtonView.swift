//
//  PlusButtonView.swift
//  MyToDoSlideApp
//
//  Created by Kato Ryota  on 24/04/20.
//  Copyright © 2020 Kato Ryota . All rights reserved.
//
import UIKit

class ButtonView{
    
    
    func PlusButtonView(width: CGFloat ,height: CGFloat){
        let button:UIButton = UIButton(frame: CGRect(x: 0, y: 50, width: width, height: height / 4))
        button.backgroundColor = .black
        button.setTitle("sample", for: .normal)
        button.setTitleColor(.white, for: .normal)
 
    }
    
}
