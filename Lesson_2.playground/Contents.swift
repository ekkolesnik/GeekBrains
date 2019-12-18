import UIKit

//1. Написать функцию, которая определяет, четное число или нет.

func evenNumber(number:Int) -> String {

    if number % 2 == 0 {
        return "Число \(number) чётное"
    } else {
        return "Число \(number) не чётное"
    }
}

print("Ответ на Задание №1:\n\(evenNumber(number: 7))")

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func numberDivision(number:Int) -> String {
    
    if (number % 2) % 3 == 0 {
        return "Вы указали число \(number). Его число без остатка делится на 3"
    } else {
        return "Указанное число \(number) не является числом без остатка"
    }
}

print("\nОтвет на задание №2:\n\(numberDivision(number: 18))")

//3. Создать возрастающий массив из 100 чисел.

var array = [Int]()

var i = 0

while i < 100 {
    array.append( i + 1 )
    i += 1
}

print("\nОтвет на задание №3:\n\(array)")

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for i in array where ( i % 2 == 0) || ( i % 3 == 0) {
    array.remove(at: array.firstIndex(of: i)!)
}

print("\nОтвет на задание №4:\n\(array)")

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

//Решение 1 (Долгий вариант сжирающий время и память)
//func funcFib(_ n: Int) -> Decimal{
//
//    if n == 0 {
//        return 0
//    } else if n == 1 {
//        return 1
//    }
//
//return funcFib(n-1) + funcFib(n-2)
//
//}
//
//var arrayF = [Decimal]()
//arrayF.append(0)
//var n  = 100
//for i in 1...n {
//    arrayF.append(funcFib(i))
//}
//print(arrayF)

//Решение 2 (Быстрый вариант)
func funcFib2(n: Int) -> (Decimal) {
    if n < 2 {
        return 1
    } else {
        var tmp1: Decimal = 1
        var tmp2: Decimal = 1
        var tmp: Decimal
        
        for _ in 2...n {
            tmp = tmp1 + tmp2
            tmp1 = tmp2
            tmp2 = tmp
        }
        return tmp2
    }
}

var arrayF2 = [Decimal]()

for i in 1...100 {
    arrayF2.append(funcFib2(n: i))
}

print("\nОтвет на задание №5:\n\(arrayF2)")

//6 задание интересное, но для себя его пройду чуть позже, а сейчас пока сдам остальные чтоб уложиться до следующего вебинара. Если я правильно понял, задания со * не входят в обязательные.
