// 8ms
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var len = 0, front = ListNode(-1, head), current = front
        while let node = current.next {
            len += 1
            current = node
        }
        var index = len - n - 1
        current = front
        (-1..<index).forEach { _ in current = current.next! }
        var next = current.next!
        current.next = next.next
        next.next = nil
        return front.next
    }
}