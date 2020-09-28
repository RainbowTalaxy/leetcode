// 84ms
var postorderTraversal = function (root) {
    var result = []
    if (root != null) {
        result.push(postorderTraversal(root.left))
        result.push(postorderTraversal(root.right))
        result.push(root.val)
    }
    return result.flat()
};