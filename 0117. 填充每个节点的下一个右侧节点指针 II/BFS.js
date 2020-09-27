// 112ms
var connect = function (root) {
    if (root != null) {
        let q = [[root, 0]], pre = [root, -1]
        while (q.length != 0) {
            let [node, level] = q.shift()
            pre[0].next = level == pre[1] ? node : null
            pre = [node, level]
            if (node.left != null) {
                q.push([node.left, level + 1])
            }
            if (node.right != null) {
                q.push([node.right, level + 1])
            }
        }
    }
    return root
};