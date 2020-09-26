// 104ms
var lowestCommonAncestor = function (root, p, q) {
    var left = Math.min(p.val, q.val), right = Math.max(p.val, q.val)
    while (true) {
        if (root.val >= left && root.val <= right) {
            return root
        } else if (right <= root.val) {
            root = root.left
        } else if (left >= root.val) {
            root = root.right
        }
    }
};