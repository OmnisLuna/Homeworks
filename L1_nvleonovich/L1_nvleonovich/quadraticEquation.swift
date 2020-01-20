//
//   quadratic_equation.swift
//  L1_nvleonovich
//
//  Created by nvleonovich on 16/01/2020.
//  Copyright © 2020 nvleonovich. All rights reserved.
//

import Foundation

func solveQuadraticEquation() -> (Double, Double) {
    let a: Double = 3
    let b: Double = -14
    let c: Double = -5
    
    let D = pow(b, 2)-4*a*c
    
    let x1: Double = (-b+sqrt(D))/(2*a)
    let x2: Double = (-b-sqrt(D))/(2*a)
    return (x1, x2)
}
