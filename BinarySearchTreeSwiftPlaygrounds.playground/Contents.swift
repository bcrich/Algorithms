class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(data: Int) {
        self.data = data
    }
}

class BinarySearchTree {

    func insert(_ data: Int, root: Node?) -> Node? {
        let node = Node(data: data)
        if root == nil {
            return node
        }
        var current: Node?
        var parent: Node?

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

    func search(root: Node?, key: Int) -> Node? {
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

    func preorder(root: Node) {
        print(root.data)

        if let left = root.left {
            print(preorder(root: left))
        }

        if let right = root.right {
            print(preorder(root: right))
        }
    }

    func inorder(root: Node) {
        if let left = root.left {
            print(preorder(root: left))
        }

        print(root.data)

        if let right = root.right {
            print(preorder(root: right))
        }
    }

    func postorder(root: Node) {
        if let left = root.left {
            print(preorder(root: left))
        }

        if let right = root.right {
            print(preorder(root: right))
        }

        print(root.data)
    }

    func minValueNode(node: Node?) -> Node? {
        var current = node

        while current?.left != nil {
            current = current?.left
        }

        return current
    }

    func deleteNode(root: Node?, data: Int) -> Node? {
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

    func invertTree(_ root: Node?) -> Node? {
        let root = root
        if root == nil {
            return root
        }
        let temp = invertTree(root?.left)
        root?.left = invertTree(root?.right)
        root?.right = temp

        return root
    }

    func rootToLeafSum(_ root: Node?, _ sum: Int, _ result: [Int]) -> Bool {
        var result = result
        if root == nil {
            return false
        }

        //check leafy node
        if root?.left == nil && root?.right == nil {
            if sum == root?.data {
                result.append((root?.data)!)
                return true
            }
        }
        // if its non leafy go to the left
        if rootToLeafSum(root?.left, sum - (root?.data)!, result) {
            result.append((root?.data)!)
            return true
        }

        // if result not found, go to the right
        if rootToLeafSum(root?.right, sum - (root?.data)!, result) {
            result.append((root?.data)!)
            return true
        }

        return false
    }

}


let root = Node(data: 10)
let tree = BinarySearchTree()
tree.insert(12, root: root)
tree.insert(8, root: root)
tree.insert(11, root: root)
tree.insert(4, root: root)
tree.insert(14, root: root)
tree.insert(6, root: root)
tree.insert(9, root: root)

tree.search(root: root, key: 14)

print("--------")
print("preorder traversal")
tree.preorder(root: root)

print("--------")
print("postorder traversal")
tree.postorder(root: root)

print("--------")
print("inorder traversal")
tree.inorder(root: root)

tree.deleteNode(root: root, data: 6)
print("*********")
tree.inorder(root: root)

print("*********")
tree.invertTree(root)


