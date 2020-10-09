// 96ms
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if var node = head {
            while node.val != Int.max {
                print(node.val)
                node.val = Int.max
                if let next = node.next {
                    node = next
                } else {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
}