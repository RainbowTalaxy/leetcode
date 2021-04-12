// 16ms
class Solution {
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var preNum: Int? = nil
        var minn = Int.max

        func inOrder(_ node: TreeNode?) {
            if let node = node {
                inOrder(node.left)
                if let preNum = preNum {
                    minn = min(node.val - preNum, minn)
                }
                preNum = node.val
                inOrder(node.right)
            }
        }
        
        inOrder(root)
        return minn
    }
}