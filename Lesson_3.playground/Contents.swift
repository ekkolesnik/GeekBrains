import UIKit

enum Actions {
    case startEngine
    case stopEngine
    case openWindow
    case closeWindow
}

enum Pogruzka {
    case loading(Int)
    func shet() -> Int {
        switch self {
        case .loading(let num):
            return num
        }
    }
}

struct Car {
    var model = "BMW"
    var year = 2018
    var trunkVolume = 180
    var trunkFilled = 0
    var engine = "Двигатель остановлен"
    var windowsOpen = "Окна закрыты"
    
    mutating func сhangeProperty(property: Actions){
        if property == .closeWindow {
            self.windowsOpen = "Окна закрыты"
        } else if property == .openWindow {
            self.windowsOpen = "Окна открыты"
        } else if property == .startEngine {
            self.engine = "Двигатель запущен"
        } else if property == .stopEngine {
            self.engine = "Двигатель остановлен"
        }
    }
    
    mutating func pogruzka(nam: Pogruzka){
        if nam.shet() > self.trunkVolume {
            print("\nИзвините, вес слишком большой")
        } else if nam.shet() <= self.trunkVolume {
            self.trunkFilled = nam.shet()
        }
    }
    
    func allProperty(){
        print("\nОписание авто:\nМодель: \(self.model)\nГод выпуска: \(self.year)\nВместимость багажника: \(self.trunkVolume) л.\nЗаполненность багажника: \(self.trunkFilled)\nДвигатель: \(self.engine)\nОкна (статус): \(self.windowsOpen)")
    }
}

struct Truck {
    var model = "Scania"
    var year = 2015
    var trunkVolume = 3000
    var trunkFilled = 0
    var engine = "Двигатель остановлен"
    var windowsOpen = "Окна закрыты"
    
    mutating func сhangeProperty(property: Actions){
        if property == .closeWindow {
            self.windowsOpen = "Окна закрыты"
        } else if property == .openWindow {
            self.windowsOpen = "Окна открыты"
        } else if property == .startEngine {
            self.engine = "Двигатель запущен"
        } else if property == .stopEngine {
            self.engine = "Двигатель остановлен"
        }
    }
    
    mutating func pogruzka(nam: Pogruzka){
        if nam.shet() > self.trunkVolume {
            print("\nИзвините, вес слишком большой")
        } else if nam.shet() <= self.trunkVolume {
            self.trunkFilled = nam.shet()
        }
    }
    
    func allProperty(){
        print("\nОписание авто:\nМодель: \(self.model)\nГод выпуска: \(self.year)\nВместимость груза: \(self.trunkVolume) л.\nЗаполненность багажника: \(self.trunkFilled)\nДвигатель: \(self.engine)\nОкна (статус): \(self.windowsOpen)")
    }
}

var bmw = Car()
bmw.сhangeProperty(property: .stopEngine)
bmw.сhangeProperty(property: .openWindow)
bmw.pogruzka(nam: .loading(300))
bmw.allProperty()

var scania = Truck()
scania.сhangeProperty(property: .startEngine)
scania.сhangeProperty(property: .openWindow)
scania.pogruzka(nam: .loading(1500))
scania.allProperty()

