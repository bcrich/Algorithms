import UIKit

class Stack<T> {
    var array = [T]()
    var top = -1
    var max = 5

    func push(_ data: T) {
        if top < max {
            top = top + 1
            array.insert(data, at: top)
        }
    }

    func pop() -> T {
        var removed: T?
        if top > -1 {
            removed = array[top]
            array.remove(at: top)
            top = top - 1
        }
        return removed!
    }
}

class Queue<T> {
    let stackA = Stack<T>()
    let stackB = Stack<T>()

    func enqueue(_ data: T) {
        stackA.push(data)
    }

    func dequeue() {
        for _ in 0..<stackA.array.count {
            stackB.push(stackA.pop())
        }
        print("popping \(stackB.pop())")
        for _ in 0..<stackB.array.count {
            stackA.push(stackB.pop())
        }
    }

    func printQueue() {
        for i in 0..<stackA.array.count {
            print(stackA.array[i])
        }
    }
}

let queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)
queue.enqueue(40)
queue.enqueue(50)
queue.enqueue(60)
queue.dequeue()
queue.printQueue()
queue.dequeue()
queue.printQueue()


let stringQueues = Queue<String>()
stringQueues.enqueue("Hello")
stringQueues.enqueue("World")
stringQueues.enqueue("iOS")
stringQueues.enqueue("is Awesome!")
stringQueues.printQueue()
stringQueues.dequeue()
stringQueues.printQueue()
stringQueues.dequeue()
stringQueues.printQueue()


