//
//  main.swift
//  L1_nvleonovich
//
//  Created by nvleonovich on 10/01/2020.
//  Copyright © 2020 nvleonovich. All rights reserved.
//

import Foundation


print("Корни квадратного уравнения: ", solveQuadraticEquation(), "\n")

print("Параметры прямоугольного треугольника: ", "\n")

let a: Double = 5
let b: Double = 5
let c: Double = findTriangleHypotenuse(a: a, b: b)

print("Гипотенуза: ", c)
print("Периметр: ", findTrianglePerimeter(a: a, b: b, c: c))
print("Площадь треугольника", findTriangleSquare(a: a, b: b), "\n")

print("Калькулятор банковского вклада за 5 лет: \n")
print("Введите сумму вклада числом ")
var deposit = Double(readLine()!)!
print("Введите процент, который будет начисляться ежегодно (от 0 до 100) ")
let percent = Double(readLine()!)!
print("Размер вклада по годам: ")
findContribution(deposit: deposit, percent: percent)
