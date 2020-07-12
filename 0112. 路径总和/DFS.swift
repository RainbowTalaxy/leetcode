class Solution {
    var goal = 0

    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        goal = sum
        return search(root)
    }

    func search(_ root: TreeNode?) -> Bool {
        if let root = root {
            if root.left == nil && root.right == nil {
                return root.val == goal
            } else {
                root.left?.val += root.val
                root.right?.val += root.val
                return search(root.left) || search(root.right)
            }
        } else {
            return false
        }
    }
}