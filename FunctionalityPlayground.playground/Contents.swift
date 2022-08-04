import UIKit

// 2
/*
Pure Function - то-есть чистые функции, это такие функции, которые обрабатывают только данные, которые имеют сами, например входные, но изменяют внешние данные например глобальные переменные. Результат выполнения таких функций всегда предстказуем.
*/

// 3
var myArray = [1, 3, 2, 4, 7, -1, 2]

let sortedArray = myArray.sorted()
print(sortedArray)

// 4
let stringArray = myArray.map( {"\($0)"})
print(stringArray)

//5
let names = ["Влад", "Илья", "Никита", "Артем", "Максим"]
print(names.reduce("", {"\($0), \($1)" }))

//6
var b = 1
func myFunc (someFunc: @escaping () -> Void){

    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        b += 1
        someFunc()
    }
}

myFunc {
    print(b)
}
print(b)

//7
// Напишите функцию, которая принимает в себя две функции и возвращает функцию, которая при вызове выполнит первые две функции.

func newFunc(firstFunc: @escaping () -> Void, secondFunc: @escaping () -> Void) -> () -> () {
    
    func returnFunc() -> () -> () {
        func smthFunc(){
            firstFunc()
            secondFunc()
        }
        smthFunc()
        return smthFunc
    }
    
    return returnFunc()
}

newFunc(firstFunc: {
    print("good")
}, secondFunc: {
    print("work")
})

//8
//Напишите функцию, которая сортирует массив по переданному алгоритму: принимает в себя массив чисел и функцию, которая берёт на вход два числа, возвращает Bool (должно ли первое число идти после второго) и возвращает массив, отсортированный по этому алгоритму.


public var myNewArray = [1, 10, 2, 4, 7, -1, 2]

func sortMyArray(func1: (_ x1: Int, _ x2: Int) -> Bool) -> [Int] {
    var array2 = myNewArray
    
    for i in 0..<array2.count {
        let index = (array2.count - 1) - i
        
        for j in 0..<index{
            
            if func1(array2[j], array2[j + 1]) == true {
                let el = array2[j]
                array2[j] = array2[j + 1]
                array2[j + 1 ] = el
            }
        }
    }
    return array2
}

sortMyArray { x1, x2 in
    if x1 < x2 {
        return false
    } else {
        return true
    }
}

// 9
// Напишите своими словами, что такое infix-, suffix-, prefix-операторы.

/*
 suffix-, prefix-операторы - это такие операторы с помощью которых мы можем "вырезать" определнную часть строки prefix с начала строки, suffix с конца соответсвенно
 А с помощью infix мы можем сделать свои кастомные операторы, включающие более одного оператора и дополнительные параметры
 */

//Пример
var str = "Hello, world"
str.prefix(6)
str.suffix(5)


