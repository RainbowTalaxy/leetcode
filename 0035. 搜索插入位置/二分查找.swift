// 40ms
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        while left < right {
            var mid = (left + right) / 2
            if target > nums[mid] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return right
    }
}