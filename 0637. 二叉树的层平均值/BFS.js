// 92ms
var averageOfLevels = function(root) {
    var result = [], queue = []
    if (root != null) {
        queue.push([root, 0])
    }
    while (queue.length != 0) {
        let [node, level] = queue.shift()
        if (result[level] == undefined) {
            result[level] = []
        }
        result[level].push(node.val)
        if (node.left != null) {
            queue.push([node.left, level + 1])
        }
        if (node.right != null) {
            queue.push([node.right, level + 1])
        }
    }
    return result.map(i => {
        let sum = i.reduce((a, c) => a + c)
        return sum / i.length
    })
};