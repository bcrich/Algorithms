// Given a tree as shown below, traverse in a spiral order

/*

          10
         /   \
        8    20
       /    /  \
      6     14 21

 // output: 10 20 8 6 14 21
 */



class Node {
    var left: Node?
    var right: Node?
    let data: Int

    init(data: Int) {
        self.data = data
    }
}

class Tree {
    func insert(_ root: Node?, _ data: Int) -> Node? {
        let node = Node(data: data)
        if root == nil { return root }
        var current = root
        var parent: Node?
        while current != nil {
            parent = current
            if data <= (current?.data)! {
                current = current?.left
            } else if data > (current?.data)! {
                current = current?.right
            }
        }
        if data > (parent?.data)! {
            parent?.right = node
        } else if data <= (parent?.data)! {
            parent?.left = node
        }
        return root
    }

    func spiralTraversal(_ root: inout Node?) -> Node? {
        if root == nil { return root }
        var s1 = [Node]()
        var s2 = [Node]()
        s1.append(root!)

        while !s1.isEmpty || !s2.isEmpty {
            while !s1.isEmpty {
                root = s1.removeLast()
                print((root?.data)!)
                if root?.left != nil {
                    s2.append((root?.left)!)
                }
                if root?.right != nil {
                    s2.append((root?.right)!)
                }
            }
            while !s2.isEmpty {
                root = s2.removeLast()
                print((root?.data)!)
                if root?.right != nil {
                    s1.append((root?.right)!)
                }
                if root?.left != nil {
                    s1.append((root?.left)!)
                }
            }
        }
        return root
    }
}

var tree = Tree()
var root: Node? = Node(data: 10)
tree.insert(root, 20)
tree.insert(root, 8)
tree.insert(root, 6)
tree.insert(root, 14)
tree.insert(root, 21)
tree.spiralTraversal(&root)
