// 36ms
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var np = 0, p = 0, preNum: Int?, time = 0
        while np < nums.count {
            if preNum != nums[np] {
                nums[p] = nums[np]
                p += 1
                preNum = nums[np]
                time = 1
            } else {
                if time < 2 {
                    nums[p] = nums[np]
                    p += 1
                }
                time += 1
            }
            np += 1
        }
        return p
    }
}