// 8ms
class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var result = 0
        func dfs(_ pre: Int, _ root: TreeNode) {
            let val = pre * 10 + root.val
            if let left = root.left {
                dfs(val, left)
            }
            if let right = root.right {
                dfs(val, right)
            }
            if root.left == nil && root.right == nil {
                result += val
            }
        }
        if let root = root {
            dfs(0, root)
        }
        return result
    }
}