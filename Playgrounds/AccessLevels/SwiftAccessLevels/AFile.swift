//
//  AFile.swift
//  SwiftAccessLevels
//
//  Created by Angela Yu on 14/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class AClass {
    
    //Global variables, also called class properties.
    private var aPrivateProperty = "private property"
    
    fileprivate var aFilePrivateProperty = "fileprivate property"
    
    var anInternalProperty = "internal property"
    
    func methodA () {
        
        var aLocalVariable = "local variable"
        
        //Step 1. Try to print aLocalVariable Here - Possible
        //print("\(aLocalVariable) printed from methodA in AClass - local") // possible
        
        //Step 3. Try to print aPrivateProperty Here
       // print("\(aPrivateProperty) printed From Method A in AClass - private") //possible
        //Step 6. Try to print aFilePrivateProperty Here
       // print("\(aFilePrivateProperty) printed From Method A in AClass - filePrivate") //possible
        //Step 9. Try to print anInternalProperty Here
       // print("\(anInternalProperty) printed From Method A in AClass - internal") //possible
    }
    
    func methodB () {
        
        //Step 2. Try to print aLocalVariable Here
        //print("\(aLocalVariable) printed from methodA in AClass - local") --> This is out of scope
        //Step 4. Try to print aPrivateProperty Here
        print("\(aPrivateProperty) printed From Method B in AClass - private") //possible
    }
    
}

class AnotherClassInTheSameFile {
    
    init() {
        
        let aClass = AClass()
        
        //Step 5. Try to print aPrivateProperty Here
        //print("\(aPrivateProperty) printed in AnotherClass - private") //--> Private to AClass should not print
        
        //Step 7. Try to print aFilePrivateProperty Here
        print("\(aClass.aFilePrivateProperty) printed From in AnotherClass - filePrivate") //--> Possible
        
    }
}
