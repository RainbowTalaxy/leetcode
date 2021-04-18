// 76ms
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }

        var p = 0
        for num in nums {
            if num != nums[p] {
                p += 1
                nums[p] = num
            }
        }
        return p + 1
    }
}