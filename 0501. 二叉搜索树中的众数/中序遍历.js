// 92ms
var findMode = function (root) {
    var maxn = 0, result = [], pre = Infinity, count = -1
    function inOrder(root) {
        if (root != null) {
            inOrder(root.left)
            if (root.val == pre) {
                count += 1
            } else {
                if (count > maxn) {
                    maxn = count
                    result = [pre]
                } else if (count == maxn) {
                    result.push(pre)
                }
                pre = root.val
                count = 1
            }
            inOrder(root.right)
        }
    }
    inOrder(root)
    if (count > maxn) {
        maxn = count
        result = [pre]
    } else if (count == maxn) {
        result.push(pre)
    }
    return result
};