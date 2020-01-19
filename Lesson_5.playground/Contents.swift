import UIKit

protocol NewCar {
    
    var model: String { get set }
    var engine: Car.Action.Engi { get set }
    var windows: Car.Action.Wind { get set }
    
    func description1()
    
}

extension NewCar {

    mutating func openCloseWindow(param: Car.Action.Wind) {
        self.windows = param
    }
    
    mutating func startStopEngine(param: Car.Action.Engi) {
        self.engine = param
    }
    
}

class Car: NewCar {
    
    enum Action {
        enum Engi {
            case start
            case stop
        }
        
        enum Wind {
            case open
            case close
        }
        
        case engine(name: Engi)
        case window(name: Wind)
    }
    
    var model: String
    var engine: Action.Engi
    var windows: Action.Wind
    
    func description1(){
        print("model: \(self.model) \nengine: \(self.engine) \nwindows: \(self.windows)")
    }
    
    init(model: String, engine: Action.Engi, windows: Action.Wind) {
        self.model = model
        self.engine = engine
        self.windows = windows
    }
}

class TunkCar: Car, CustomStringConvertible {
    var description: String { return "model: \(self.model) \nengine: \(self.engine) \nwindows: \(self.windows)" }
    
    var ammo: String?
    
    enum Ammo {
        case big
        case small
    }
    
    func property(name: Ammo){
        switch name {
        case .big:
            self.ammo = "TNT"
        case .small:
            self.ammo = "tnt"
        }
    }
    
    override func description1() {
        print("model: \(self.model) \nengine: \(self.engine) \nwindows: \(self.windows) \nammo: \(String(describing: self.ammo!))")
    }
}

class SportСar: Car, CustomStringConvertible {
    var description: String { return "model: \(self.model) \nengine: \(self.engine) \nwindows: \(self.windows)" }
    
    var nitro: String?
    
    enum Nitro {
        case on
        case off
    }
    
    func property(name: Nitro){
        switch name {
        case .on:
            self.nitro = "ON"
        case .off:
            self.nitro = "OFF"
        }
    }
    
    override func description1() {
        print("model: \(self.model) \nengine: \(self.engine) \nwindows: \(self.windows) \nnitro: \(String(describing: self.nitro!))")
    }
    
}
var tunk = TunkCar(model: "Tunk", engine: .stop, windows: .open)
tunk.property(name: .big)
tunk.startStopEngine(param: .start)
print(tunk.description)
tunk.description1()

var sport = SportСar(model: "BMW", engine: .start, windows: .close)
sport.property(name: .on)
sport.openCloseWindow(param: .close)
sport.description1()
print(sport.description)
