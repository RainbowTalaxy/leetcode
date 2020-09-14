// 84ms
var inorderTraversal = function (root) {
    var result = []
    if (root != null) {
        let stack = [[root, true]]
        while (stack.length != 0) {
            let [p, flag] = stack.pop()
            if (flag) {
                if (p.right != null) {
                    stack.push([p.right, true])
                }
                stack.push([p, false])
                if (p.left != null) {
                    stack.push([p.left, true])
                }
            } else {
                result.push(p.val)
            }
        }
    }
    return result
};