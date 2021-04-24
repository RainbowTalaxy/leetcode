// 4ms
class Solution {
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var nodeList: [TreeNode?] = []
        func inOrder(_ node: TreeNode?) {
            if let node = node {
                inOrder(node.left)
                nodeList.append(node)
                inOrder(node.right)
            }
        }
        inOrder(root)
        nodeList.append(nil)
        for i in 0..<(nodeList.count - 1) {
            nodeList[i]!.left = nil
            nodeList[i]!.right = nodeList[i + 1]
        }
        return nodeList[0]
    }
}