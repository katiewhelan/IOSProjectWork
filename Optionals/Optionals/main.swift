let myOptional: String?

myOptional = nil

//let text: String = myOptional! // this will crash

//check for nil

if myOptional != nil{
    let text : String = myOptional!
}else{
    print("myOptional was nil")
}


// optional binding

if let safeOptional = myOptional{
    let text : String = safeOptional
}else{
    print("Could not turn to safeOptional")
}

//Nil coalescing operator

let text : String = myOptional ?? "Default Value"
print(text)

//Optional Chaining

struct MyOptionalStruct{
    var property = 123
    func method(){
        print("myOptional method")
    }
}

let myOptionalStruct : MyOptionalStruct?
myOptionalStruct = nil
print(myOptionalStruct?.property)
