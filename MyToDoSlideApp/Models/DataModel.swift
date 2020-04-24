//
//  DataModel.swift
//  MyToDoSlideApp
//
//  Created by Kato Ryota  on 24/04/20.
//  Copyright © 2020 Kato Ryota . All rights reserved.
//

import Foundation
import RealmSwift

class DataModel: Object{
    @objc dynamic var dayToDoThing = ""
    @objc dynamic var monthToDoThing = ""
    @objc dynamic var yearToDoThing = ""
    @objc dynamic var lifeToDoThing = ""
    @objc dynamic var bookTitle = ""
}
