//: Playground - noun: a place where people can play


class Node<T> {
    var data: T
    var next: Node?

    init(_ data: T) {
        self.data = data
    }
}

class Queue<T> {
    func enqueue(head: Node<T>?, _ data: T) -> Node<T>? {
        var head = head
        let node = Node(data)
        if head == nil {
            head = node
            return head
        }
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = node

        return head
    }

    func printQueue(_ head: Node<T>?) {
        if head == nil {
            print("Empty queue")
        }
        var current = head
        while current != nil  {
            print(current?.data ?? "No value")
            current = current?.next
        }
    }

    func dequeue(_ head: Node<T>?) -> Node<T>? {
        var head = head
        if head == nil {
            print("queue empty")
            return head
        }
        var current = head
        current = current?.next
        head = nil
        head = current

        return head
    }
}
var head = Node("Hello")
var queue = Queue<String>()
queue.enqueue(head: head, "world" )
queue.enqueue(head: head, "iOS" )
queue.enqueue(head: head, "is" )
queue.enqueue(head: head, "awesome!")

head = queue.dequeue(head)!
head = queue.dequeue(head)!
head = queue.dequeue(head)!
head = queue.dequeue(head)!
queue.printQueue(head)





