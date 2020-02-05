import UIKit

protocol Car {
    var brand: String { get set }
    var year: Int { get set }
    var color: String { get set}
    var cost: UInt { get set }
    mutating func changeCost(_ c: UInt)
    mutating func changeColor(_ c: String)
}

extension Car {
    mutating func changeCost(_ newCost: UInt) {
        cost = newCost
    }
    
    mutating func changeColor(_ newColor: String) {
        color = newColor
    }
}

class TrunckCar: Car {
    
    var brand: String

    var year: Int

    var color: String

    var cost: UInt

    var holdingCapacity: Int
    
    var filledBody: Int
    
    init(holdingCapacity: Int, filledBody: Int, brand: String, year: Int, color: String, cost: UInt) {
        self.holdingCapacity = holdingCapacity
        self.filledBody = filledBody
        self.brand = brand
        self.year = year
        self.color = color
        self.cost = cost
    }
}

extension TrunckCar: CustomStringConvertible {

    var description: String {
        """
        brand: \(brand)
        year: \(year)
        color: \(color)
        cost: \(cost)
        holdingCapacity: \(holdingCapacity)
        filledBody: \(filledBody)

        """
    }
}

class SportCar: Car {

    var brand: String

    var year: Int

    var color: String

    var cost: UInt

    var roofOpen: Bool

    init(roofOpen: Bool, brand: String, year: Int, color: String, cost: UInt) {
        self.roofOpen = roofOpen
        self.brand = brand
        self.year = year
        self.color = color
        self.cost = cost
    }
}

extension SportCar: CustomStringConvertible {

    var description: String {
        """
        brand: \(brand)
        year: \(year)
        color: \(color)
        cost: \(cost)
        roofOpen: \(roofOpen)

        """
    }
}

var volvo = TrunckCar(holdingCapacity: 220, filledBody: 0, brand: "volvo", year: 2019, color: "Green", cost: 123_000)
var ferrari = SportCar(roofOpen: false, brand: "Ferrari", year: 2019, color: "Blue", cost: 15_000_000)

volvo.changeColor("Red")
volvo.changeCost(100_000)

ferrari.changeColor("Black")
ferrari.changeCost(22_000_000)

print(volvo)
print(ferrari)



