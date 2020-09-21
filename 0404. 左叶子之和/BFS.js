// 72ms
var sumOfLeftLeaves = function(root) {
    var result = 0
    if (root != null) {
        var q = [root]
        while (q.length != 0) {
            let node = q.shift()
            if (node.left != null) {
                if (node.left.left == null && node.left.right == null) {
                    result += node.left.val
                } else {
                    q.push(node.left)
                }
            }
            if (node.right != null) {
                q.push(node.right)
            }
        }
    }
    return result
};