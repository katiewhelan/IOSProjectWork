//
//  Item.swift
//  Todoey
//
//  Created by Kathryn Whelan on 2/19/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentategory = LinkingObjects(fromType: ListType.self, property : "items")
}
