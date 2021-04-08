// 20ms
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0, right = nums.count - 1
        while left <= right {
            if nums[left] <= nums[right] {
                return nums[left]
            } else {
                let middle = (left + right) / 2
                if nums[middle] > nums[right] {
                    left = middle + 1
                } else {
                    right = middle
                }
            }
        }
        return nums[left]
    }
}