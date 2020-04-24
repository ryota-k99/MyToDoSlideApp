//
//  AddData.swift
//  MyToDoSlideApp
//
//  Created by Kato Ryota  on 24/04/20.
//  Copyright © 2020 Kato Ryota . All rights reserved.
//

import Foundation
import RealmSwift

class AddData{
    @objc func pushButton(toDoThing:Any){
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Items", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default){(action)in
            
            let toDoData: DataModel = DataModel()
            
            toDoData.toDoThing = textField.text!
            
            let realmData = try! Realm()
            
            try! realmData.write {
                realmData.add(toDoData)
            }
            
            self.tableView.reloadData()

        }
        
        alert.addTextField{(alertTextField)in
            alertTextField.placeholder = "Create"
            textField = alertTextField
            
        }
        
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
}
