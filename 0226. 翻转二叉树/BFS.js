// 84ms
var invertTree = function (root) {
    if (root != null) {
        var q = [root]
        while (q.length != 0) {
            let p = q.shift()
            let t = p.left
            p.left = p.right
            p.right = t
            if (p.left != null) {
                q.push(p.left)
            }
            if (p.right != null) {
                q.push(p.right)
            }
        }
    }
    return root
};