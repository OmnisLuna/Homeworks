import Foundation

class Human {
    var age: Int

    init(age: Int) {
        self.age = age
    }
}

struct Queue<T> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) { // enqueue
        elements.append(element)
    }
    
    mutating func pop() -> T? { // dequeue
        if elements.isEmpty {
            return nil
        } else {
            return elements.removeFirst()
        }
    }
    
    func filter<T>(queue: Queue<T>, predicate: (T) -> Bool) -> Queue<T> {
        var queue = queue
        var result = Queue<T>()
        
        while let next = queue.pop() {
            if predicate(next) {
                result.push(next)
            }
        }
        return result
    }
}

var human = Queue<Human>()

human.push(Human(age:22))
human.push(Human(age:56))
human.push(Human(age:15))
human.push(Human(age:38))
human.push(Human(age:62))
human.push(Human(age:28))
human.push(Human(age:70))
human.pop()
human.pop()

human.filter(queue: human, predicate: {human in return human.age <= 60})


