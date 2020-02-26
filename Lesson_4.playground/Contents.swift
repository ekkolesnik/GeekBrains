import UIKit

class Car {
    
    enum Action {
        enum Engi {
            case start
            case stop
        }
        
        enum Wind {
            case open
            case close
        }
        
        enum Ammo {
            case big
            case small
        }
        
        case engine(name: Engi)
        case window(name: Wind)
        case ammo(name: Ammo)
    }
    
    var model: String
    var engine: Action.Engi
    var windows: Action.Wind
    
    func description(){
        print("model: \(self.model) \nengine: \(self.engine) \nwindows: \(self.windows)")
    }
    
    init(model: String, engine: Action.Engi, windows: Action.Wind) {
        self.model = model
        self.engine = engine
        self.windows = windows
    }
}

class TunkCar: Car {
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
    
    override func description() {
        print("model: \(self.model) \nengine: \(self.engine) \nwindows: \(self.windows) \nammo: \(String(describing: self.ammo!))")
    }
}

class SportСar: Car {
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
    
    override func description() {
        print("model: \(self.model) \nengine: \(self.engine) \nwindows: \(self.windows) \nnitro: \(String(describing: self.nitro!))")
    }
    
}

var tunk = TunkCar(model: "Tunk", engine: .stop, windows: .open)
tunk.property(name: .big)
tunk.description()

var sport = SportСar(model: "BMW", engine: .start, windows: .close)
sport.property(name: .on)
sport.description()
