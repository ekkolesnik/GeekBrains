import UIKit

//Задание_1

//Формула дискриминанта d=b*b-4ac
//1.если d<0, то корней нет
//2.если d=0, то один корень
//3.если d>0, то два корня

var b = 3
var a = 2
var c = 4

var d = b * b - 4 * a * c

if d > 0 {
    print("Задание_1:\nДискриминант имеет два корня")
} else if d < 0{
    print("Задание_1:\nДискриминант не имеет корней")
} else if d == 0 {
    print("Задание_1:\nДискриминант имеет один корень")
}

//Задание_2

var z: Double = 3.3
var x: Double = 4.2

//Длинна гипотенузы
var v = sqrt(z * z + x * x)

//Площадь треугольника
var s = (z * x) / 2

//Периметр треугольника
var p = z + x + s

print("Задание_2:\nДлинна гипотенузы: \(v)\nПлощадь треугольника: \(s)\nПериметр треугольника: \(p)")

//Задание_3
//Пользователь вводит сумму вклада в банк и годовой процент.
//Найти сумму вклада через 5 лет.

var vklad: Double = 400
var protsent: Double = 10

var year: Double = 5

var protsenti = protsent / 100

var year1 = vklad + (vklad * protsenti)
var year2 = year1 + (year1 * protsenti)
var year3 = year2 + (year2 * protsenti)
var year4 = year3 + (year3 * protsenti)
var year5 = year4 + (year4 * protsenti)

print("Задание_3:\nПервоначальный вклад \(vklad) под \(protsent) процентов.\nСумма вклада через 5 лет: \(year5)")

