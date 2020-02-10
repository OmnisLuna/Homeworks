import UIKit

class Human {
    var years: Int

    init(years: Int) {
        self.years = years
    }
}

struct Queue<T> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeFirst()
    }
}

var human = Queue<Human>()
//human.sort()
human.push(Human(years:22))
human.push(Human(years:56))
human.push(Human(years:15))
human.push(Human(years:38))
human.push(Human(years:62))
human.pop()
human.pop()
