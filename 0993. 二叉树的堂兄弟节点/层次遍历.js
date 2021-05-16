// 88ms
var isCousins = function(root, x, y) {
    let queue = [root]
    while (queue.length != 0) {
        let newQueue = []
        let xp = -1, yp = -1, p = 0
        for (let node of queue) {
            if (node != null) {
                if (node.left?.val == x) {
                    xp = p
                } else if (node.left?.val == y) {
                    yp = p
                }
                p += 1
                if (node.right?.val == x) {
                    xp = p
                } else if (node.right?.val == y) {
                    yp = p
                }
                p += 1
                newQueue.push(node.left, node.right)
            }
        }
        if ((xp + 1 == yp && xp % 2 == 0) || (yp + 1 == xp && yp % 2 == 0)) {
            return false
        } else if (xp != -1 && yp != -1) {
            return true
        }
        queue = newQueue
    }
    return false
};