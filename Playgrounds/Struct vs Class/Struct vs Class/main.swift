//
//  main.swift
//  Struct vs Class
//
//  Created by Kathryn Whelan on 2/21/21.
//

import Foundation
//Imutibility
let classHero = ClassSuperhero(name: "Iron Man", universe: "Marvel")
classHero.name = "Hulk" // --> even though class hero is defined as let it still allows the name to change(class level is at var)

let strutHero = StructHero(name: "Iron Man", universe: "Marvel")
//strutHero.name = "Hulk" //--> THis will not work
print(strutHero.reverseName())















//CLASSES

//var classHero = ClassSuperhero(name: "Iron Man", universe: "Marvel")
//var copyClassHero = classHero
//copyClassHero.name = "Hulk"
//
//var classAvengers = [classHero, copyClassHero]
//
//classAvengers[0].name = "Thor"
//
//
//print("heroClass Name is = \(classHero.name!)")
//print("copyHeroClass Name is = \(copyClassHero.name!)" )
//print("Avengers position 0 name = \(classAvengers[0].name!)")
//print()


//STRUCTS

//var structHero = StructHero(name: "Iron Man", universe: "Marvel")
//var structHeroCopy = structHero
//structHeroCopy.name = "Hulk"
//
//var structAvengers = [structHero, structHeroCopy]
//
//structAvengers[0].name = "Thor"
//
//print("heroStruct Name is = \(structHero.name)")
//print("copyHeroStruct Name is = \(structHeroCopy.name)" )
//print("Avengers position 0 name = \(structAvengers[0].name)")
