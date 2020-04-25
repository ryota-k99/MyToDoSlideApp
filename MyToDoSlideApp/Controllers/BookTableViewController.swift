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

class BookTableViewController: UITableViewController,SegementSlideContentScrollViewDelegate {
    
    var BookArray: Results<BookDataModel>!
    let buttonView = ButtonView()
    
    let realm = try! Realm()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let width:CGFloat = self.view.bounds.width
        let height:CGFloat = self.view.bounds.height
        
        let realm = try! Realm()
        self.BookArray = realm.objects(BookDataModel.self)
        tableView.backgroundColor = .white
        tableView.sectionHeaderHeight = 50

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
        
        return BookArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        let item:BookDataModel = self.BookArray[indexPath.row]
        
        cell.textLabel?.text = item.bookTitle
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        print(item.bookTitle)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let plusButtonView = buttonView.PlusButtonView()
        plusButtonView.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        
        return plusButtonView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let alert = UIAlertController(title: "完了しましたか？", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "完了", style: .default){(action)in
            
            if let item: BookDataModel = self.BookArray[indexPath.row]{
                do{
                    try self.realm.write {
                        self.realm.delete(item)
                        self.tableView.reloadData()
                    }
                }catch{
                    print(error)
                }
            }
        }
        let cancelButton = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancelButton)
        present(alert,animated: true,completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete{
           if let item: BookDataModel = BookArray[indexPath.row]{
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
            
            let toDoData: BookDataModel = BookDataModel()
            
            toDoData.bookTitle = textField.text!
            
            let realmData = try! Realm()
            
            try! realmData.write {
                realmData.add(toDoData)
            }
            
            self.tableView.reloadData()

        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addTextField{(alertTextField)in
            alertTextField.placeholder = "Create"
            textField = alertTextField
            
        }
        
        
        alert.addAction(action)
        alert.addAction(cancelButton)
        present(alert,animated: true,completion: nil)
    }


}
