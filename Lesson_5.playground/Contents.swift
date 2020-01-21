import UIKit

//Создание стэка с использованием дженерика
struct Queue<T: LosslessStringConvertible> {
    
    var arr: [T] = []
    
    mutating func push(_ elements: T){
        arr.append(elements)
    }
    
    mutating func pop() -> T? {
        return arr.popLast()
    }
    
//Умножение всех значений массива на 5 при помощу .map
    func mapFunction() -> [Int?] {

        let arr1 = arr.map{
            (value) -> Int? in
            
            if let value = value as? Int {
                return value * 5
            } else {
                return nil
            }
        }
        return arr1
    }

//Оставляем в массиве только чётные числа при помощи .filter
    func filterFunctionInt() -> [Int] {
        return arr.filter{ (($0 as? Int)!) % 2 == 0 } as! [Int]
    }
    
 //Удаление совпадающих значений при помощи .reduce
    func reduceFunction() -> [Int?] {
        
        let arr1 = arr.map{
            (value) -> Int? in
            
            if let value = value as? Int {
                return value
            } else {
                return nil
            }
        }
        
        let arr2 = arr1.reduce(into: []) {
        !$0.contains($1) ? $0.append($1) : () }
        
        return arr2
        }
    
//subscript, который будет возвращать nil в случае обращения к несуществующему индексу
    subscript(elements: Int) -> String? {
        
        var answer = ""
        
        if elements > arr.count {
            return nil
        } else {
            answer = String(arr[elements])
        }
        return answer
    }
        }

var queue = Queue<Int>()

queue.push(1)
queue.push(2)
queue.push(3)
queue.push(3)
queue.push(3)
queue.push(4)
queue.push(5)

print(queue)
queue.mapFunction()
queue.filterFunctionInt()
queue.reduceFunction()
queue[6]
