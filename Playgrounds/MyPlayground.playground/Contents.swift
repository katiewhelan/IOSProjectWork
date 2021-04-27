import UIKit

struct Town
{
    let name: String
    var citizens: [String]
    var resources: [String : Int]
    
    init(townName:String, people:[String], stats:[String:Int]) {
        name = townName
        citizens = people
        resources = stats
    }
    func fortify(){
        print("Defences Increased")
    }
}

var noWhereIsland = Town(townName: "Nowhere Island", people: ["Tom Hanks"], stats:     ["Coconuts":100])





//Closures

let array = [1,2,3,4,5]

func addOne(n1: Int)-> Int{
  return n1 + 1
}
//turn fun addone to closure

//{(n1: Int)-> Int in return n1 + 1}
array.map(addOne)
print(array.map(addOne))


array.map({(n1: Int)-> Int in return n1 + 1})

print(array.map({(n1: Int)-> Int in return n1 + 1}))



array.map{$0+1}
print(array.map{$0+1})

