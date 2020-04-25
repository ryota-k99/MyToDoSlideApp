//
//  DataModel.swift
//  MyToDoSlideApp
//
//  Created by Kato Ryota  on 24/04/20.
//  Copyright © 2020 Kato Ryota . All rights reserved.
//

import Foundation
import RealmSwift

class DayDataModel: Object{
    @objc dynamic var dayToDoThing = ""
}

class MonthDataModel: Object{
    @objc dynamic var monthToDoThing = ""
}

class YearDataModel: Object{
   @objc dynamic var yearToDoThing = ""
}

class LifeDataModel: Object{
    @objc dynamic var lifeToDoThing = ""
}

class BookDataModel: Object{
   @objc dynamic var bookTitle = ""
}
