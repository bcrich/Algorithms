class Node<T> {
    var data: T
    var left: Node?
    var right: Node?

    init(data: T) {
        self.data = data
    }
}

class BinarySearchTree<T: Comparable> {

    func insert(_ data: T, root: Node<T>?) -> Node<T>? {
        let node = Node(data: data)
        if root == nil {
            return node
        }
        var current: Node<T>?
        var parent: Node<T>?

        current = root
        while current != nil {
            parent = current
            if data > (current?.data)! {
                current = current?.right
            } else {
                current = current?.left
            }
        }
        if data > (parent?.data)! {
            parent?.right = node
        } else {
            parent?.left = node
        }

        return root
    }

    func search(root: Node<T>?, key: T) -> Node<T>? {
        if root == nil {
            return nil
        }
        if let root = root {
            if key == root.data {
                return root
            } else if key > root.data {
                return search(root: root.right, key: key)
            } else {
                return search(root: root.left, key: key)
            }
        }
        return nil
    }

    func preorder(root: Node<T>) {
        print(root.data)

        if let left = root.left {
            print(preorder(root: left))
        }

        if let right = root.right {
            print(preorder(root: right))
        }
    }

    func inorder(root: Node<T>) {
        if let left = root.left {
            print(preorder(root: left))
        }

        print(root.data)

        if let right = root.right {
            print(preorder(root: right))
        }
    }

    func postorder(root: Node<T>) {
        if let left = root.left {
            print(preorder(root: left))
        }

        if let right = root.right {
            print(preorder(root: right))
        }

        print(root.data)
    }

    func minValueNode(node: Node<T>?) -> Node<T>? {
        var current = node

        while current?.left != nil {
            current = current?.left
        }

        return current
    }

    func deleteNode(root: Node<T>?, data: T) -> Node<T>? {
        var root = root
        if root == nil {
            return root
        }

        if data < (root?.data)! {
            return deleteNode(root: root?.left, data: data)
        } else if data > (root?.data)! {
            return deleteNode(root: root?.right, data: data)
        } else {
            if root?.left == nil {
                let temp = root?.right
                root = nil
                return temp
            } else if root?.right == nil {
                let temp = root?.left
                root = nil
                return temp
            }
        }

        let temp = minValueNode(node: root?.right)
        root?.data = (temp?.data)!
        root?.right = deleteNode(root: root?.right, data: (temp?.data)!)
        
        return root
    }
}


let root = Node<String>(data: "k")
let tree = BinarySearchTree<String>()
tree.insert("m", root: root)
tree.insert("c", root: root)
tree.insert("a", root: root)
tree.insert("r", root: root)
tree.insert("z", root: root)
tree.insert("i", root: root)
tree.insert("d", root: root)

tree.search(root: root, key: "a")

print("--------")
print("preorder traversal")
tree.preorder(root: root)

print("--------")
print("postorder traversal")
tree.postorder(root: root)

print("--------")
print("inorder traversal")
tree.inorder(root: root)

tree.deleteNode(root: root, data: "c")
print("*********")
tree.inorder(root: root)


