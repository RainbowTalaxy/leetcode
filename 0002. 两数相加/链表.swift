// 60ms
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var c = 0, head = ListNode(), current = head, p1 = l1, p2 = l2
        while p1 != nil && p2 != nil {
            current.next = ListNode((p1!.val + p2!.val + c) % 10)
            current = current.next!
            c = (p1!.val + p2!.val + c) / 10
            p1 = p1!.next
            p2 = p2!.next
        }
        while p1 != nil {
            current.next = ListNode((p1!.val + c) % 10)
            current = current.next!
            c = (p1!.val + c) / 10
            p1 = p1!.next
        }
        while p2 != nil {
            current.next = ListNode((p2!.val + c) % 10)
            current = current.next!
            c = (p2!.val + c) / 10
            p2 = p2!.next
        }
        if c > 0 {
            current.next = ListNode(c)
        }
        return head.next
    }
}