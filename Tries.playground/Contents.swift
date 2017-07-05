class TrieNode {
    var children: [Character: TrieNode]
    var endOfWord: Bool

    init() {
        children = [Character: TrieNode]()
        endOfWord = false
    }
}

class Trie {
    var root: TrieNode

    init() {
        root = TrieNode()
    }

    func insert(_ word: String ){
        var current = root
        for char in word.characters {
            var node = current.children[char]
            if node == nil {
                node = TrieNode()
                current.children[char] = node
            }
            if let node = node {
                current = node
            }
        }
        current.endOfWord = true
    }

    func containsWholeWord(_ word: String) -> Bool {
        var current = root
        for char in word.characters {
            let node = current.children[char]
            if let node = node {
                current = node
            } else {
                return false
            }
        }
        return current.endOfWord
    }

    func containsPrefix(_ word: String) -> Bool {
        var current = root
        for char in word.characters {
            let node = current.children[char]
            if node == nil {
                return false
            } else {
                if let node = node {
                    current = node
                }
            }
        }
        return true
    }
}

let trie = Trie()
trie.insert("Robert")
trie.insert("Ranger")
trie.insert("Reeser")
trie.insert("Rutger")

trie.containsWholeWord("Robert")
trie.containsWholeWord("Range")
trie.containsPrefix("Ree")
trie.containsPrefix("Rut")
