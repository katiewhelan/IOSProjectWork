import Foundation
var pizzaInInches: Int = 10 {
    willSet {
        print(newValue)
        print(pizzaInInches)
    }
    didSet {
        if pizzaInInches >= 18 {
            print("Not a valid pizza size, pizzaInInches set to 18" )
            pizzaInInches = 18
        }
        
    }
}


pizzaInInches = 33

print(pizzaInInches)



//var numberOfPeople: Int = 12
//let slicesPerPerson: Int = 4

//Getter Informal
//var numberofSlices: Int {
//
//  return  pizzaInInches - 4
//}

//FORMAL SYNTAX
//var numberOfSlices : Int {
//    get{
//        return pizzaInInches - 4
//    }
////    set{
////        print("NumberOfSlices now has a new value which is \(newValue)")
////    }
//}
//
//
//var numberOfPizza : Int {
//    get{
//        let numberOfPeopleFedPerPizza = numberOfSlices/slicesPerPerson
//        return numberOfPeople/numberOfPeopleFedPerPizza
//    }
//    set{
//        let totalSlices = numberOfSlices * newValue
//        numberOfPeople = totalSlices/slicesPerPerson
//    }
//}
//
//
//numberOfPizza = 4
//print(numberOfPeople)


//Observed Properties
