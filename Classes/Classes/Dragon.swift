class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(_ speach : String  ){
        print("\(speach)")
    }
    
    override func move() {
        print("Fly Forward")
    }
    
    override func attack() {
        super.attack()
       print("Spits fire, does 10 damage")
    }
}
