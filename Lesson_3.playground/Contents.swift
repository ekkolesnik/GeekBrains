import UIKit

// Создание перечисления со всеми действиями над авто
enum Actions2 {
    enum Loa {
        case loading
        case unloading
    }
    
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
    case loading(doing: Loa, mass: Int)
}

//Создание структуры авто
struct Car {
    
    var model: String
    var year: Int
    var trunkVolume: Int
    var trunkFilled: Int
    var engine: String
    var windows: String
    
    mutating func сhangeProperty(property: Actions2){
        switch property {
        case .engine(name: .start):
            self.engine = "Start"
        case .engine(name: .stop):
            self.engine = "Stop"
        case let .loading(doing, mass):
            let tv = trunkVolume
            let tf = trunkFilled
            let ma = mass
            if tf + ma < tv && doing == .loading {
                trunkFilled = trunkFilled + mass
            } else if tf + ma == tv && doing == .loading {
                print("ВНИМАНИЕ: Багажник заполнен!")
                trunkFilled = trunkFilled + mass
            } else if tf + ma > tv && doing == .loading {
                print("Погрузка не возможна, так как будет привышен максимально допустимый вес, равный: \(trunkVolume)")
            } else if tf - ma < 0 && doing == .unloading {
                print("В багажнике нет столько груза для его разгрузки")
            } else if tf - ma > 0 && doing == .unloading {
                trunkFilled = trunkFilled - mass
            }
        case .window(name: .close):
            self.windows = "Close"
        case .window(name: .open):
            self.windows = "Open"
        }
    }
    
    func allProperty(){
        print("\nОписание авто:\nМодель: \(self.model)\nГод выпуска: \(self.year)\nВместимость багажника: \(self.trunkVolume) л.\nЗаполненность багажника: \(self.trunkFilled) л.\nДвигатель: \(self.engine)\nОкна (статус): \(self.windows)")
    }
    
    init(model: String, year: Int, trunkVolume: Int) {
        self.model = model
        self.year = year
        self.trunkVolume = trunkVolume
        self.trunkFilled = 0
        self.engine = "Stop"
        self.windows = "Close"
    }
    
}

// Инициализация авто
var auto = Car.init(model: "BMW", year: 2018, trunkVolume: 300)

// Загрузка/Разгрузка
auto.сhangeProperty(property: .loading(doing: .loading, mass: 60))
auto.сhangeProperty(property: .loading(doing: .unloading, mass: 40))

// Изменение свойств авто
auto.сhangeProperty(property: .engine(name: .start))
auto.сhangeProperty(property: .window(name: .open))

// Вывод всех показателей в консоль
auto.allProperty()

// Создание структуры грузовика
struct Truck {
    
    var model: String
    var year: Int
    var trunkVolume: Int
    var trunkFilled: Int
    var engine: String
    var windows: String
    
    mutating func сhangeProperty(property: Actions2){
        switch property {
        case .engine(name: .start):
            self.engine = "Start"
        case .engine(name: .stop):
            self.engine = "Stop"
        case let .loading(doing, mass):
            let tv = trunkVolume
            let tf = trunkFilled
            let ma = mass
            if tf + ma < tv && doing == .loading {
                trunkFilled = trunkFilled + mass
            } else if tf + ma == tv && doing == .loading {
                print("ВНИМАНИЕ: Грузовой отсек заполнен!")
                trunkFilled = trunkFilled + mass
            } else if tf + ma > tv && doing == .loading {
                print("Погрузка не возможна, так как будет привышен максимально допустимый вес, равный: \(trunkVolume)")
            } else if tf - ma < 0 && doing == .unloading {
                print("В грузовом отсеке нет столько груза для его выгрузки")
            } else if tf - ma > 0 && doing == .unloading {
                trunkFilled = trunkFilled - mass
            }
        case .window(name: .close):
            self.windows = "Close"
        case .window(name: .open):
            self.windows = "Open"
        }
    }
    
    func allProperty(){
        print("\nОписание грузовика:\nМодель: \(self.model)\nГод выпуска: \(self.year)\nВместимость грузового отсека: \(self.trunkVolume) л.\nЗаполненность грузового отсека: \(self.trunkFilled) л.\nДвигатель: \(self.engine)\nОкна (статус): \(self.windows)")
    }
    
    init(model: String, year: Int, trunkVolume: Int) {
        self.model = model
        self.year = year
        self.trunkVolume = trunkVolume
        self.trunkFilled = 0
        self.engine = "Stop"
        self.windows = "Close"
    }
    
}

// Инициализация авто
var gruzovik = Truck.init(model: "Scania", year: 2020, trunkVolume: 4000)

// Загрузка/Разгрузка
gruzovik.сhangeProperty(property: .loading(doing: .loading, mass: 2400))
gruzovik.сhangeProperty(property: .loading(doing: .unloading, mass: 300))

// Изменение свойств авто
gruzovik.сhangeProperty(property: .engine(name: .start))
gruzovik.сhangeProperty(property: .window(name: .open))

// Вывод всех показателей в консоль
gruzovik.allProperty()
