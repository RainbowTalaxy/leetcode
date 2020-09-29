// 144ms
var insertIntoBST = function (root, val) {
    var current = root, node = new TreeNode(val)
    if (root != null) {
        while (true) {
            if (val < current.val) {
                if (current.left == null) {
                    current.left = node
                    break
                } else {
                    current = current.left
                }
            } else {
                if (current.right == null) {
                    current.right = node
                    break
                } else {
                    current = current.right
                }
            }
        }
        return root
    } else {
        return node
    }
};