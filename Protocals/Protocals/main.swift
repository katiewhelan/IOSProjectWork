protocol CanFly{
    func fly()
}

class Bird{
    
     var isFemale = true
    
//    func fly(){
//        print("Flap wings")
//    }
    func layEgg(){
        if isFemale {
            print("Hatchling")
        }
    }
}

class Eagle: Bird, CanFly{
    
    func soar() {
        print("THe eagle glids on air currents")
    }
    func fly(){
        print("the Eagle can Fly")
    }
}

class Penguin: Bird{
    func swim(){
        print("Paddle through the water")
    }
}

//struct FlyingMuseum{
//    func flyingDemo(flyingObject : Bird){
//       // flyingObject.fly()
//    }
//}

struct FlyingMuseum{
    func flyingDemo(flyingObject : CanFly){
       // flyingObject.fly()
    }
}
struct Airplane{
    
}

let myEagle = Eagle()
//myEagle.fly()
myEagle.layEgg()
myEagle.soar()

let myPenguin = Penguin()
//myPenguin.fly()
myPenguin.swim()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)

let myPlane = Airplane()
museum.flyingDemo(flyingObject: CanFly)
