//
//  ListType.swift
//  Todoey
//
//  Created by Kathryn Whelan on 2/19/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class ListType: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
