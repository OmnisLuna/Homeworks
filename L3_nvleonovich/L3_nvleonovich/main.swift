//
//  main.swift
//  L3_nvleonovich
//
//  Created by nvleonovich on 30/01/2020.
//  Copyright © 2020 nvleonovich. All rights reserved.
//

import Foundation

enum Actions {
    case switchEngine(state: EngineState)
    case changeCost(c: UInt)
    case openRoof
    case closeRoof
    case putInBody(v: Float)
    case getFromBody(v:Float)
    }

enum EngineState {
    case works
    case stoped
}
    
class Car: CustomStringConvertible {
    let brand: String
    let year: Int
    var color: String
    var cost: UInt
    var engineState: EngineState
    
    init(brand: String, year: Int, color: String, cost: UInt, engineState: EngineState){
        self.brand = brand
        self.year = year
        self.color = color
        self.cost = cost
        self.engineState = engineState
    }
    
    func doAction (action: Actions) {
        switch action {
        case .switchEngine(let state):
            engineState = state
        case .changeCost(let c):
            cost = c
        default:
            break
        }
    }
    
    var description: String {
        """
        brand: \(brand)
        year: \(year)
        color: \(color)
        cost: \(cost)
        engineState: \(engineState)
        
        """
    }
}

class TruckCar: Car {
    var holdingCapacity: Float
    var filledBody: Float
    
    init(holdingCapacity: Float, filledBody: Float, brand: String, year: Int, color: String, cost: UInt, engineState: EngineState){
        self.holdingCapacity = holdingCapacity
        self.filledBody = filledBody
        super.init(brand: brand, year: year, color: color, cost: cost, engineState: engineState)
    }
    
    override func doAction(action: Actions) {
        switch action {
        case .putInBody(v: let volume):
            if (filledBody + volume) <= holdingCapacity {
                filledBody += volume
            } else {
                print("Ошибка! Нельзя добавить больше груза в кузов")
            }

        case .getFromBody(v: let volume):
            if filledBody == 0 {
                print("Ошибка! В кузове сейчас нет груза")
            } else if filledBody < volume {
                print("Ошибка! В кузове недостаточно груза:\nХотите получить \(volume)\nВ наличии: \(filledBody)")
            } else {
                filledBody -= volume
            }
        default:
            super.doAction(action: action)
        }
    }
    
    override var description: String {
        """
        holdingCapacity: \(holdingCapacity)
        filledBody: \(filledBody)
        \(super.description)
        """
    }
}

class SportCar: Car {
    var roofOpen: Bool
    
    init(roofOpen: Bool, brand: String, year: Int, color: String, cost: UInt, engineState: EngineState) {
        self.roofOpen = roofOpen
        super.init(brand: brand, year: year, color: color, cost: cost, engineState: engineState)
    }
    
    override func doAction(action: Actions) {
        switch action {
        case .openRoof:
            roofOpen = true
        case .closeRoof:
            roofOpen = false
        default:
            super.doAction(action: action)
        }
    }
    
    override var description: String {
        """
        roofOpen: \(roofOpen)
        \(super.description)
        """
    }
}

var ford = Car(brand: "Ford", year: 2001, color: "black", cost: 650_000, engineState: .stoped)
var volvo = TruckCar(holdingCapacity: 239, filledBody: 0, brand: "Volvo", year: 2009, color: "green", cost: 1_200_000, engineState: .stoped)
var ferrari = SportCar(roofOpen: false, brand: "Ferrari", year: 2019, color: "red", cost: 15_000_000, engineState: .stoped)

ford.doAction(action: .switchEngine(state: .works))
ford.doAction(action: .changeCost(c: 640_000))
volvo.doAction(action: .putInBody(v: 150))
volvo.doAction(action: .getFromBody(v: 100))
ferrari.doAction(action: .openRoof)
ferrari.doAction(action: .closeRoof)

print(ford)
print(volvo)
print(ferrari)
