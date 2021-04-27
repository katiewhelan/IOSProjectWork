protocol AdvancedLifeSupport{
    func performCPR()
}

class EmergencyCallHandler{
    var delegate: AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport{
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("Basic life Support given")
    }
    
    
}


class Doctor: AdvancedLifeSupport {
    
    init(handler:EmergencyCallHandler) {
        handler.delegate = self
    }
     
    func performCPR() {
        print("Life Support given")
    }
    
    func useStethascope(){
        print("Listen for heart beat")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sing staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr...")
    }
}


let emillio = EmergencyCallHandler()
//let Peter = Paramedic(handler: emillio)
let angela = Surgeon(handler: emillio)

emillio.assessSituation()
emillio.medicalEmergency()
