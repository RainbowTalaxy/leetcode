// 32ms
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if let root = root {
            return 1 + max(maxDepth(root.left), maxDepth(root.right))
        } else {
            return 0
        }
    }
}