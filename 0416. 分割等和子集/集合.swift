// 244ms
class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        var target = nums.reduce(0, +)
        guard target % 2 == 0 else {
            return false
        }
        target /= 2
        var sums = Set<Int>()
        sums.insert(0)
        for num in nums {
            for sum in sums {
                sums.insert(sum + num)
            }
            if sums.contains(target) {
                return true
            }
        }
        return false
    }
}