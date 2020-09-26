// 84ms
var pathSum = function (root, sum) {
    var currentPath = [], result = []
    function search(root, sum) {
        if (root != null) {
            currentPath.push(root.val)
            if (root.left == null && root.right == null) {
                if (sum == root.val) {
                    result.push(currentPath.slice())
                }
            } else {
                search(root.left, sum - root.val)
                search(root.right, sum - root.val)
            }
            currentPath.pop()
        }
    }
    search(root, sum)
    return result
};