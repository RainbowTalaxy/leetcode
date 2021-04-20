// 12ms
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var p = 0
        for num in nums {
            if num != val {
                nums[p] = num
                p += 1
            }
        }
        return p
    }
}