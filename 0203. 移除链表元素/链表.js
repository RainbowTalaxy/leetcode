// 136ms
var removeElements = function(head, val) {
    head = new ListNode(0, head)
    let current = head
    while (current.next !== null) {
        if (current.next.val === val) {
            let del = current.next
            current.next = del.next
            del.next = null
        } else {
            current = current.next
        }
    }
    return head.next
};