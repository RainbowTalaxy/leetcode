// 628ms
class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        func inOrder(_ node: TreeNode?) {
            if let node = node {
                if node.val > low {
                    inOrder(node.left)
                }
                if node.val >= low && node.val <= high {
                    sum += node.val
                }
                if node.val < high {
                    inOrder(node.right)
                }
            }
        }
        inOrder(root)
        return sum
    }
}