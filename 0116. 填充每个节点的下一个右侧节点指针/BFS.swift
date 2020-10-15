// 108ms
class Solution {
    func connect(_ root: Node?) -> Node? {
        var pre: Node?, preLevel = -1
        var queue = [(Node, Int)]()
        if let root = root {
            queue.append( (root, 0) )
            while !queue.isEmpty {
                let (node, level) = queue.removeFirst()
                pre?.next = level == preLevel ? node : nil
                pre = node
                preLevel = level
                if let left = node.left {
                    queue.append( (left, level + 1) )
                }
                if let right = node.right {
                    queue.append( (right, level + 1) )
                }
            }
        }
        return root
    }
}