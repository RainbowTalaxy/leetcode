/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return getSubTree(nums, from: 0, to: nums.count)
    }

    func getSubTree(_ nums: [Int], from left: Int, to right: Int) -> TreeNode? {
        guard left <= right else { return nil }
        let mid = (left + right) / 2
        var node = TreeNode(nums[mid])
        node.left = getSubTree(nums, from: left, to: mid - 1)
        node.right = getSubTree(nums, from: mid + 1, to: right)
        return node
    }
}
