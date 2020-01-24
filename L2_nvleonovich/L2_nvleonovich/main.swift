//
//  main.swift
//  L2_nvleonovich
//
//  Created by nvleonovich on 23/01/2020.
//  Copyright © 2020 nvleonovich. All rights reserved.
//

import Foundation

//1 - определить четное число
func determineNumberType(N: Int) -> Bool {
    let remainder : Int = N % 2
    var even : Bool = false
    if remainder == 0 {
        even = true
    }
    return even
}
//2 - определить число кратно трём
func numberAliqoutThree(N: Int) -> Bool {
    let remainder : Int = N % 3
    var multiplicity : Bool = false
    if remainder == 0 {
        multiplicity = true
    }
    return multiplicity
}
//3 - создание массива из 100 чисел
let arr = Array<Int>(0..<100)

//4 - проверяем элементы старого массива на соответствие условиям и подходящие добавляем в новый массив
var newArr = Array<Int>()
for i in arr {
    if determineNumberType(N: arr[i]) == true && numberAliqoutThree(N: arr[i]) == true {
        newArr.append(i)
    }
}
print(newArr)

//5 - функция, которая создает числа Фибоначчи и добавляет их в массив

var cache = Dictionary<Int, Int>() //создаю переменную, чтобы хранить уже посчитанные значения и не считать их заново

func getFibonacciNumber(_ N: Int) -> Int {
    if N == 0 {
        return 0
    } else if N == 1 {
        return 1
    } else if cache[N] != nil {
        return cache[N]!
    }
    let fvalue = getFibonacciNumber(N - 1) + getFibonacciNumber(N - 2)
    cache[N] = fvalue
    return fvalue
}

var farr = Array<Int>()
for e in 0..<93 { //только до 93, потому что в Int не хватает места 
    farr.append(getFibonacciNumber(e))
}
print(farr)
