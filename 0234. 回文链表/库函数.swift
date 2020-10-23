// 108ms
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var current = head
        var vals = [Int]()
        while let node = current {
            vals.append(node.val)
            current = node.next
        }
        return vals == vals.reversed()
    }
}