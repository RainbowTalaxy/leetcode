// 144ms
var convertBST = function (root) {
    var sum = 0
    function travel(root) {
        if (root != null) {
            travel(root.right)
            sum += root.val
            root.val = sum
            travel(root.left)
        }
    }
    travel(root)
    return root
};