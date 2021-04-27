//
//  StructExample.swift
//  Struct vs Class
//
//  Created by Kathryn Whelan on 2/21/21.
//

import Foundation

struct StructHero {
    var name : String
    var universe : String
    
    func reverseName() -> String {
        return String(self.name.reversed())
    }
    
    mutating func reverseNameMutable(){
        self.name = String(self.name.reversed())
    }
    
}


//let hero = StructHero(name: "Iron Mane", universe: "Marvel")
