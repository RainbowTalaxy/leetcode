// 4ms
class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }

        var table = [Int](repeating: 0, count: nums.count)
        for i in 0..<(nums.count - 1) {
            var r1 = i > 0 ? table[i - 1] : 0
            var r2 = (i > 1 ? table[i - 2] : 0) + nums[i]
            table[i] = max(r1, r2)
        }
        var result = table[nums.count - 2]

        for i in 0..<nums.count {
            var r1 = i > 1 ? table[i - 1] : 0
            var r2 = (i > 2 ? table[i - 2] : 0) + nums[i]
            table[i] = max(r1, r2)
        }
        result = max(table[nums.count - 1], result)
        
        return result
    }
}