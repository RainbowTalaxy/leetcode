// 84ms
var binaryTreePaths = function(root) {
    var current = [], result = []
    function search(node) {
        current.push(node.val)
        if (node.left == null && node.right == null) {
            result.push(current.join("->"))
        } else {
            if (node.left != null) {
                search(node.left)
            }
            if (node.right != null) {
                search(node.right)
            }
        }
        current.pop()
    }
    if (root != null) {
        search(root)
    }
    return result
};