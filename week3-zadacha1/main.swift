//
//  main.swift
//  week3-zadacha1
//
//  Created by tiger on 19.06.2019.
//  Copyright © 2019 homework. All rights reserved.
//

import Foundation

//1. Используя Optional Chaining, через экземпляр структуры First задать свойства всем структурам и напечатать, то что вернет subscript

struct First {
    var second:Second?
    // сабскрипт с входным индексом index выводит строку - элемент массива из структуры Third
    subscript(index: Int) -> String {
        // делаем проверку на индекс в пределах исходного массива
        // нафиг индекс надо проверить на нил массив!!!
        let count = second?.third?.strArray?.count
        if second?.third?.strArray != nil {
            // проверка что индекс массива не задан больше чем count
            if (index<=count!) {
                return second?.third?.strArray?[index] ?? "string is nil!" // строку из массива структуры Third
            } else {
                print("Индекс массива больше, чем размер массива")
            }
        } else {
            return "Массив не содержит ни одной строки"
        }
    return "none"
    }
}


struct Second {
    var third:Third?
}

struct Third {
    var strArray:Array<String>?
}

let sourceArr: Array<String> = ["One", "Two", "Three"]
let initArr: Array<String> = []

var third = Third(strArray: sourceArr) //проинициализируем с пустым массивом initArr
var second = Second(third: third)
var first = First(second: second)

first.second? = second
first.second?.third?.strArray = sourceArr // Third Array = ["One", "Two", "Three"]

print(first[1]) // выведет Two
print(first[4]) // Указанный индекс больше, чем размер массива!

print(first[0]) // выведет строку по индексу 0 - One
