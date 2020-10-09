// 题解来源：https://leetcode-cn.com/problems/linked-list-cycle-ii/solution/huan-xing-lian-biao-iiswift-by-nothot/
// 68ms
class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head, slow = head, step = 2
        while fast != nil {
            fast = step == 2 ? fast!.next?.next : fast!.next
            slow = slow!.next
            if fast === slow {
                if step == 1 || fast === head {
                    return fast
                }
                slow = head
                step = 1
            }
        }
        return nil
    }
}