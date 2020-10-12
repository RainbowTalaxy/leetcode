// 72ms
class Solution {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var pre: Int?, minn = Int.max
        func inOrder(_ root: TreeNode?) {
            if let root = root {
                if let left = root.left {
                    inOrder(left)
                }
                if let pre = pre {
                    let newValue = abs(root.val - pre)
                    minn = min(newValue, minn)
                }
                pre = root.val
                if let right = root.right {
                    inOrder(right)
                }
            }
        }
        inOrder(root)
        return minn
    }
}