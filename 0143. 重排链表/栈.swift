// 192ms
class Solution {
    func reorderList(_ head: ListNode?) {
        var nodes = [ListNode]()
        var current = head
        while let node = current {
            nodes.append(node)
            current = node.next
        }
        var list = [ListNode]()
        while !nodes.isEmpty {
            if !nodes.isEmpty {
                list.append(nodes.removeFirst())
            }
            if !nodes.isEmpty {
                list.append(nodes.removeLast())
            }
        }
        var pre: ListNode?
        for node in list {
            if let pre = pre {
                pre.next = node
            }
            pre = node
        }
        pre?.next = nil
    }
}