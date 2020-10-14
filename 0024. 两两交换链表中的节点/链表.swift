// 8ms
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        func swap(_ current: ListNode, _ pre: ListNode?) {
            if let next = current.next {
                var node = next.next
                next.next = current
                current.next = node
                if let node = node {
                    swap(node, current)
                }
                pre?.next = next
            }
        }
        if let head = head {
            var result = head.next ?? head
            swap(head, nil)
            return result
        } else {
            return nil
        }
    }
}