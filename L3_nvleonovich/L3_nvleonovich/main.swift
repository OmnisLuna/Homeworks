//
//  main.swift
//  L3_nvleonovich
//
//  Created by nvleonovich on 28/01/2020.
//  Copyright © 2020 nvleonovich. All rights reserved.
//

import Foundation

struct Car {
    let brand: String
    let year: Int
    let bootVolume: Float
    var filledBootVolume: Float
    var windowsOpened: Bool
    var engineWorks: Bool
    
    mutating func switchProps (action: Actions) {
        switch action {
        case .startEngine:
            engineWorks = true
        case .stopEngine:
            engineWorks = false
        case .openWindows:
            windowsOpened = true
        case .closeWindows:
            windowsOpened = false
            
        case .putIn(v: let volume):
            if (filledBootVolume + volume) <= bootVolume {
                filledBootVolume += volume
            } else {
                print("Ошибка! Нельзя добавить больше груза в багажник")
            }
            
        case .pickUp(v: let volume):
            if filledBootVolume == 0 {
                print("Ошибка! В багажнике сейчас нет груза")
            } else if filledBootVolume < volume {
                print("Ошибка! В багажнике недостаточно груза:\nХотите получить \(volume)\nВ наличии: \(filledBootVolume)")
            } else {
                filledBootVolume -= volume
            }
        }
    }
}

struct Truck {
    let brand: String
    let year: Int
    let bootVolume: Float
    var filledBootVolume: Float
    var windowsOpened: Bool
    var engineWorks: Bool
    
    mutating func switchProps (action: Actions) {
        switch action {
        case .startEngine:
            engineWorks = true
        case .stopEngine:
            engineWorks = false
        case .openWindows:
            windowsOpened = true
        case .closeWindows:
            windowsOpened = false
            
        case .putIn(v: let volume):
            if (filledBootVolume + volume) <= bootVolume {
                filledBootVolume += volume
            } else {
                print("Ошибка! Нельзя добавить больше груза в кузов")
            }
            
        case .pickUp(v: let volume):
            if filledBootVolume == 0 {
                print("Ошибка! В кузове сейчас нет груза")
            } else if filledBootVolume < volume {
                print("Ошибка! В кузове недостаточно груза:\nХотите получить \(volume)\nВ наличии: \(filledBootVolume)")
            } else {
                filledBootVolume -= volume
            }
        }
    }
}

enum Actions {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case putIn (v: Float)
    case pickUp (v: Float)
}
    
var lada = Car(brand: "Lada", year: 2017, bootVolume: 220, filledBootVolume: 0, windowsOpened: false, engineWorks: true)
var kamaz = Truck(brand: "KAMAZ-6520", year: 1996, bootVolume: 1000, filledBootVolume: 0, windowsOpened: false, engineWorks: false)

lada.switchProps(action: .stopEngine)
lada.switchProps(action: .putIn(v: 100))
lada.switchProps(action: .pickUp(v: 77.5))

kamaz.switchProps(action: .startEngine)
kamaz.switchProps(action: .openWindows)
kamaz.switchProps(action: .putIn(v: 800))
kamaz.switchProps(action: .pickUp(v: 200.5))

print(lada)
print(kamaz)
