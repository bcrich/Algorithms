import Foundation

protocol QueueProtocol {
    associatedtype T
    mutating func enqueue(_ data: T)
    mutating func dequeue() -> (T)?
    func printQueue()
}

struct Queue<T>: QueueProtocol {
    private var array = [T]()
    private var rear: Int!
    private var front: Int!
    private var MAX_COUNT = 4

    init() {
        rear = 0
        front = -1
    }

    mutating func enqueue(_ data: T) {
        if front < MAX_COUNT {
            front = front + 1
            array.insert(data, at: front)
        } else {
            print("Queue is full")
        }
    }

    mutating func dequeue() -> (T)? {
        var toRemove: T!

        if array.count == 0 {
            print("Queue Empty")
            return nil
        }
        toRemove = array[rear]
        array.remove(at: rear)

        return toRemove
    }

    func printQueue() {
        for i in 0..<array.count {
            print(array[i])
        }

    }
}

var queue = Queue<String>()
queue.enqueue("Hello")
queue.enqueue("World,")
queue.enqueue("iOS")
queue.enqueue("is")
queue.enqueue("awesome!")
queue.enqueue("FullStop!")

print("____")
queue.printQueue()
print("____")
print(queue.dequeue() ?? "No Value")
print(queue.dequeue() ?? "No Value")
print(queue.dequeue() ?? "No Value")
print(queue.dequeue() ?? "No Value")
print(queue.dequeue() ?? "No Value")
print(queue.dequeue() ?? "No Value")

print("____")
queue.printQueue()