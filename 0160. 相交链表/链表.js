// 108ms
ListNode.prototype.length = function() {
    let result = 0, node = this
    while (node != null) {
        result += 1
        node = node.next
    }
    return result
}

ListNode.prototype.jump = function(distance) {
    let node = this
    while (distance != 0) {
        node = node.next
        distance -= 1
    }
    return node
}

var getIntersectionNode = function(headA, headB) {
    const lenA = headA.length(), lenB = headB.length()
    const minn = Math.min(lenA, lenB)
    let nodeA = headA.jump(lenA - minn), nodeB = headB.jump(lenB - minn)
    for (let i = 0; i < minn; i += 1) {
        if (nodeA === nodeB) {
            return nodeA
        }
        nodeA = nodeA.next
        nodeB = nodeB.next
    }
    return null
};