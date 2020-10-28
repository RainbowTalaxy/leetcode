// 12ms
class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var nums = [Int: Int]()
        for num in arr {
            if let times = nums[num] {
                nums[num] = times + 1
            } else {
                nums[num] = 1
            }
        }
        var vals = Set<Int>()
        for (_, times) in nums {
            if vals.contains(times) {
                return false
            } else {
                vals.insert(times)
            }
        }
        return true
    }
}