//
//  Item.swift
//  Todoey
//
//  Created by mac on 1/27/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
//    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}