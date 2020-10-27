// 4ms
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func preOrder(_ root: TreeNode?) {
            if let root = root {
                result.append(root.val)
                preOrder(root.left)
                preOrder(root.right)
            }
        }
        preOrder(root)
        return result
    }
}