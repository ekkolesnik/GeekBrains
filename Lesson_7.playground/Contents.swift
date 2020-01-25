import UIKit

//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.

enum AirplaneError: Error {
    case radioConnectionBroken
    case noFuel
    case chassisLocked
}

class Airplane {
    
    var radioConnectionBroken = true
    var chassisReleased = "ON"
    var fuel = 0
    
    func landing() throws -> (String) {
        
        guard radioConnectionBroken else {
            throw  AirplaneError.radioConnectionBroken
        }
        guard fuel > 0 else {
            throw AirplaneError.noFuel
        }
        guard chassisReleased == "ON" else {
            throw AirplaneError.chassisLocked
        }
        
        return "Посадка произведена"
    }
}

var boing = Airplane()

do {
    try boing.landing()
} catch AirplaneError.radioConnectionBroken {
    print("Радио связь отсутствует")
} catch AirplaneError.noFuel {
    print("Бинзин на исходе")
} catch AirplaneError.chassisLocked {
    print("Шасси не выпущены")
}

//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

enum AirplaneError2: Error {
    case radioConnectionBroken
    case noFuel
    case chassisLocked
}

class Airplane2 {
    
    var radioConnectionBroken = true
    var chassisReleased = "ON"
    var fuel = 0
    
    func landing() -> (String?, AirplaneError2?) {
        
        guard radioConnectionBroken else {
            return ("Радио связь отсутствует", AirplaneError2.radioConnectionBroken)
        }
        guard fuel > 0 else {
            return ("Бинзин на исходе", AirplaneError2.noFuel)
        }
        guard chassisReleased == "ON" else {
            return ("Шасси не выпущены", AirplaneError2.chassisLocked)
        }
        
        return ("Посадка произведена", nil)
    }
}

let air1 = Airplane2()
air1.landing()
