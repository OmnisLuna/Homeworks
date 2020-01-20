//
//  File.swift
//  L1_nvleonovich
//
//  Created by nvleonovich on 20/01/2020.
//  Copyright © 2020 nvleonovich. All rights reserved.
//

import Foundation

func findTriangleHypotenuse(a: Double, b: Double) -> Double { //найти гипотенузу трейгольника
    
    let c: Double = sqrt(pow(a, 2)+pow(b, 2))
    return c
}

func findTriangleSquare(a: Double, b: Double) -> Double { //найти площадь треугольника
    
    let S: Double = (a * b)/2
    return S
}

func findTrianglePerimeter(a: Double, b: Double, c: Double) -> Double { //найти периметр треугольника
    
    let P: Double = a+b+c
    return P
}


