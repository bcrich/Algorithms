
class Node<T> {
    var data: T
    var next: Node?

    init(_ data: T) {
        self.data = data
    }
}

class SinglyLinkedList<T: Comparable> {
    var head: Node<T>?

    func insertAtEnd(_ data: T) {
        let node = Node(data)
        if head == nil {
            head = node
            return
        }

        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = node
    }

    func insertAtHead(_ data: T) {
        let node = Node(data)
        if head == nil {
            head = node
            return
        }
        node.next = head
        head = node
    }

    func insertAfterGivenNode(_ data: T, key: T) {
        let node = Node(data)
        if head == nil {
            head = node
            return
        }

        var current = head
        while current?.next?.data != key  {
            current = current?.next
        }

        node.next = current?.next?.next
        current?.next?.next = node

    }

    func insertBeforeGivenNode(_ data: T, key: T) {
        let node = Node(data)
        if head == nil {
            head = node
            return
        }

        var current = head

        if current?.data == key {
            insertAtHead(data)
            return
        }

        while current?.next?.data != key {
            current = current?.next
        }

        node.next = current?.next
        current?.next = node

    }

    func reverse() {
        if head == nil {
            print("No nodes to reverse")
            return
        }

        var current = head
        var prev: Node<T>?
        var next: Node<T>?

        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current =  next
        }
        head = prev
    }

    func deleteHead() {
        if head == nil {
            print("Nothing to delete")
            return
        }
        head = head?.next
    }

    func deleteNodeAfter(_ key: T) {
        if head == nil {
            print("nothing to delete")
            return
        }

        if head?.data == key {
            deleteHead()
            return
        }

        var current = head

        while current?.next?.data != key {
            current = current?.next
        }
        current?.next = current?.next?.next
    }

    func deleteNodeBefore(_ key: T) {
        if head == nil {
            print("Nothing to print")
            return
        }

        var current = head
        var prev: Node<T>?

        while current?.next?.data != key {
            prev = current
            current = current?.next
        }
        prev?.next = current?.next
    }

    func printList() {
        if head == nil {
            print("Nothing to print")
            return
        }

        var current = head
        while current != nil {
            print((current?.data)!)
            current = current?.next
        }
        print("----")
    }
}

let list = SinglyLinkedList<Int>()
list.insertAtEnd(10)
list.insertAtEnd(20)
list.insertAtEnd(30)
list.printList()

list.insertAtHead(40)
list.printList()

list.deleteHead()
list.printList()

list.insertAfterGivenNode(25, key: 20)
list.printList()

list.deleteHead()
list.printList()

list.insertBeforeGivenNode(15, key: 25)
list.printList()

list.insertBeforeGivenNode(10, key: 20)
list.printList()

list.deleteNodeAfter(15)
list.printList()

list.deleteNodeBefore(30)
list.printList()
