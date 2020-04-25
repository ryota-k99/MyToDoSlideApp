//
//  DayTableViewController.swift
//  MyToDoSlideApp
//
//  Created by Kato Ryota  on 21/04/20.
//  Copyright © 2020 Kato Ryota . All rights reserved.
//

import UIKit
import RealmSwift
import SegementSlide

class LifeTableViewController: UITableViewController,SegementSlideContentScrollViewDelegate {
    
    var LifeToDoArray: Results<LifeDataModel>!
    let buttonView = ButtonView()
    
    let realm = try! Realm()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let width:CGFloat = self.view.bounds.width
        let height:CGFloat = self.view.bounds.height
        
        let realm = try! Realm()

        let DayThing = LifeDataModel()
        self.LifeToDoArray = realm.objects(LifeDataModel.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    
    @objc var scrollView: UIScrollView{
          return tableView
      }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return LifeToDoArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        let item:LifeDataModel = self.LifeToDoArray[indexPath.row]
        
        cell.textLabel?.text = item.lifeToDoThing
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let plusButtonView = buttonView.PlusButtonView()
        plusButtonView.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        
        return plusButtonView
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete{
           if let item: LifeDataModel = LifeToDoArray[indexPath.row]{
               do{
                   try realm.write {
                       realm.delete(item)
                       self.tableView.reloadData()
                   }
               }catch{
                   print(error)
               }
           }
       }
   }
    
    @objc func pushButton(sender: UIButton){
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Items", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default){(action)in
            
            let toDoData: LifeDataModel = LifeDataModel()
            
            toDoData.lifeToDoThing = textField.text!
            
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
