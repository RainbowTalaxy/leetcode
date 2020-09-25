// 204ms
var buildTree = function (inorder, postorder) {
    var len = postorder.length, node = null
    if (len > 0) {
        let value = postorder[len - 1]
        node = new TreeNode(value)
        let pos = inorder.indexOf(value)
        node.left = buildTree(inorder.slice(0, pos), postorder.slice(0, pos))
        node.right = buildTree(inorder.slice(pos + 1), postorder.slice(pos, len - 1))
    }
    return node
};