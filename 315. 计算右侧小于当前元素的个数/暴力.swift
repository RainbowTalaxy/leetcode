// 3956ms
class Solution {
    func countSmaller(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[i] > nums[j] {
                    result[i] += 1
                }
            }
        }
        return result
    }
}