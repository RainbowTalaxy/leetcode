// 40ms
class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        var table = [[TreeNode?]](repeating: [], count: n + 1)
        table[0] = [nil]
        if n > 0 {
            // 动态规划部分
            for i in 1 ... n {
                for j in 0 ... (i - 1) {
                    for left in table[j] {
                        for right in table[i - 1 - j] {
                            var tree = TreeNode(-1, left, right)
                            table[i].append(tree)
                        }
                    }
                }
            }
            var count = 1
            func copyAndMark(_ tree: TreeNode?) -> TreeNode? {
                if let tree = tree {
                    var node = TreeNode()
                    node.left = copyAndMark(tree.left)
                    node.val = count
                    count += 1
                    node.right = copyAndMark(tree.right)
                    return node
                } else {
                    return nil
                }
            }
            // 将每棵树标上 1...n
            var result = [TreeNode?]()
            for node in table[n] {
                count = 1
                result.append(copyAndMark(node))
            }
            return result
        }
        return []
    }
}