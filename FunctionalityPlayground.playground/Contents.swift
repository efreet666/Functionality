import UIKit

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


public var myNewArray = [1, 3, 2, 4, 7, -1, 2]

func sortMyArray () -> [Int]) {
    
}
sortMyArray { <#([Int]) -> Void#> in
    <#code#>
}
