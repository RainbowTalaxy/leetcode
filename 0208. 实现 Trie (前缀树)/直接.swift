// 264ms
class Trie {

    class Node {
        var char: Character
        var isEnd: Bool
        var nodes: [Character: Node] = [:]

        init(_ char: Character, isEnd: Bool = false) {
            self.char = char
            self.isEnd = isEnd
        }
    }

    var root = Node(" ")

    /** Initialize your data structure here. */
    init() {}
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var current = root
        for letter in word {
            if let node = current.nodes[letter] {
                current = node
            } else {
                var node = Node(letter)
                current.nodes[letter] = node
                current = node
            }
        }
        current.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var current = root
        for letter in word {
            if let node = current.nodes[letter] {
                current = node
            } else {
                return false
            }
        }
        return current.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var current = root
        for letter in prefix {
            if let node = current.nodes[letter] {
                current = node
            } else {
                return false
            }
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */