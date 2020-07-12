class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // 别忘了是 k - 1 而不是 k
        return nums.sorted { $0 > $1 }[k - 1]
    }
}