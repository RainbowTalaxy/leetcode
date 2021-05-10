// 8ms
class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        func getLeafList(_ root: TreeNode?) -> [Int] {
            var result: [Int] = []
            func search(_ node: TreeNode?) {
                if let node = node {
                    if node.left != nil || node.right != nil {
                        search(node.left)
                        search(node.right)
                    } else {
                        result.append(node.val)
                    }
                }
            }
            search(root)
            return result
        }
        return getLeafList(root1) == getLeafList(root2)
    }
}