import Foundation

enum Cup {
    case forty
    case threeHundred
    case fourHundred
}

struct Beverage {
    var name: String
    var beverageSize: Cup
    var waterQty: Int
    var milkQty: Int
    var coffeQty: Int
}

class CoffeeMachine {
    
    enum Exception: Error, LocalizedError {
        case invalidName
        case notEnoughWater
        case notEnoughMilk
        case notEnoughCoffee
        
        var errorDescription: String? {
            switch self {
            case .invalidName:
                return "Вы ввели неправильное название продукта, попробуйте ввести ещё раз"
            case .notEnoughWater:
                return "Недостаточно воды в кофемашине для выбранного напитка"
            case .notEnoughMilk:
                return "Недостаточно молока в кофемашине для выбранного напитка"
            case .notEnoughCoffee:
                return "Недостаточно зёрен кофе в кофемашине для выбранного напитка"
            }
        }
    }
    
    var beverages = [
    "Espresso" : Beverage(name: "Espresso", beverageSize: .forty, waterQty: 40, milkQty: 0, coffeQty: 20),
    "Latte" : Beverage(name: "Latte", beverageSize: .fourHundred, waterQty: 150, milkQty: 250, coffeQty: 15),
    "Cappucino" : Beverage(name: "Cappucino", beverageSize: .threeHundred, waterQty: 100, milkQty: 250, coffeQty: 15),
    "Milk": Beverage(name:"Milk", beverageSize: .forty, waterQty: 0, milkQty: 40, coffeQty: 0)
    ]
    var coffee: Int = 250
    var milk: Int = 500
    var water: Int = 300
    
    func makeDrink(_ beverage: String) throws -> Beverage? {
        guard let item = beverages[beverage] else { throw Exception.invalidName }
        guard item.coffeQty <= coffee else { throw Exception.notEnoughCoffee }
        guard item.waterQty <= water else { throw Exception.notEnoughWater }
        guard item.milkQty <= milk else { throw Exception.notEnoughMilk }
        
        
        water -= item.waterQty
        milk -= item.milkQty
        coffee -= item.coffeQty
        print("Ваш напиток \(item.name) готов!")
        return item
    }
}

let coffeeMachine = CoffeeMachine()

func makeDerinkWithException(name: String){
    do {
        let _ = try coffeeMachine.makeDrink(name)
    } catch {
        print(error.localizedDescription)
    }
}

makeDerinkWithException(name: "Latte")
makeDerinkWithException(name: "Cappucino")
makeDerinkWithException(name: "Cappucino")
makeDerinkWithException(name: "Escprsso")
makeDerinkWithException(name: "Espresso")
