class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(data: Int) {
        self.data = data
    }
}

class BinarySearchTree {

    func insertNodeRecursive(_ root: Node?, _ data: Int) -> Node? {
        let node = Node(data: data)
        if root == nil {
            return node
        }
        if data <= (root?.data)! {
            root?.left = insertNodeRecursive(root?.left, data)
        } else {
            root?.right = insertNodeRecursive(root?.right, data)
        }
        return root
    }

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

    func isBinarySearchTree(_ root: Node?, _ min: Int, _ max: Int) -> Bool  {
        if root == nil {
            return true
        }

        if (root?.data)! > max && (root?.data)! <= min {
            return false
        }

        return isBinarySearchTree(root?.left, min, (root?.data)!) &&
            isBinarySearchTree(root?.right, (root?.data)!, max)
    }

    func breadthFirstSearch(_ root: inout Node?) {
        if root == nil {
            return
        }
        var queue = [Node]()
        queue.append(root!)
        while queue.count > 0 {
            root = queue.removeFirst()
            print((root?.data)!)
            if root?.left != nil {
                queue.append((root?.left)!)
            }
            if root?.right != nil {
                queue.append((root?.right)!)
            }
        }
    }

    func postOrderDepthFirstSearchIterative(_ root: inout Node?) {
        if root == nil {
            return
        }
        var stack1 = [Node]()
        var stack2 = [Node]()
        stack1.append(root!)
        while !stack1.isEmpty {
            root = stack1.removeLast()
            stack2.append(root!)
            if root?.left != nil {
                stack1.append((root?.left)!)
            }
            if root?.right != nil {
                stack1.append((root?.right)!)
            }
        }
        while !stack2.isEmpty {
            root = stack2.removeLast()
            print((root?.data)!)
        }
    }

    func preOrderDepthFirstTraversal(_ root: inout Node?) {
        if root == nil {
            return
        }
        var stack = [Node]()
        stack.append(root!)
        while !stack.isEmpty {
            root = stack.removeLast()
            print((root?.data)!)
            if root?.right != nil {
                stack.append((root?.right)!)
            }
            if root?.left != nil {
                stack.append((root?.left)!)
            }
        }
    }

    func inOrderDepthFirstSearch(_ root: inout Node?) {
        if root == nil {
            return
        }
        var stack = [Node]()
        while true {
            if root != nil {
                stack.append(root!)
                root = (root?.left)!
            } else {
                if stack.isEmpty { break }
                root = stack.removeLast()
                print((root?.data)!)
                root = (root?.right)!
            }
        }
    }

    func isBalanced(_ root: Node?) -> Bool  {
        if root == nil {
            return true
        }
        var leftCount = 0
        var rightCount = 0

        var current = root
        while current != nil {
            leftCount += 1
            current = current?.left
        }
        var cur = root
        while cur != nil {
            rightCount += 1
            cur = cur?.right
        }
        return (abs(leftCount - rightCount)) <= 1
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

tree.isBinarySearchTree(root, Int.min, Int.max)


var mutableRoot: Node? = Node(data: 10)
var mutableTree = BinarySearchTree()
mutableTree.insert(21, root: mutableRoot)
mutableTree.insert(15, root: mutableRoot)
mutableTree.insert(18, root: mutableRoot)
mutableTree.insert(19, root: mutableRoot)
mutableTree.insert(-6, root: mutableRoot)
mutableTree.insert(0, root: mutableRoot)
mutableTree.insert(17, root: mutableRoot)
mutableTree.insert(12, root: mutableRoot)
mutableTree.breadthFirstSearch(&mutableRoot)


mutableTree.postOrderDepthFirstSearchIterative(&mutableRoot)



