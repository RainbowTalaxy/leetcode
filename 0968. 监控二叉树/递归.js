// 来源：https://leetcode-cn.com/problems/binary-tree-cameras/solution/dfsjavajian-dan-yi-dong-by-rorke76753/
// 100ms
var minCameraCover = function (root) {
    var result = 0

    //0：可被观测但无监控，上一层节点为1
    //1：不可被观测到，上一层节点为2
    //2：有摄像机，上一层节点为0
    function reduce(root) {
        if (root != null) {
            let left = reduce(root.left), right = reduce(root.right)
            if (left == 1 || right == 1) {
                result += 1
                return 2
            } else if (left == 2 || right == 2) {
                return 0
            } else {
                return 1
            }
        } else {
            return 0
        }
    }

    if (reduce(root) == 1) {
        result += 1
    }
    return result
};