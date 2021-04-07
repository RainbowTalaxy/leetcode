// 40ms
// 官方题解
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        switch nums.count {
        case 0:
            return false
        case 1:
            return nums[0] == target
        default:
            var left = 0, right = nums.count - 1
            while left <= right {
                let middle = (left + right) / 2
                if nums[middle] == target {
                    return true
                } else {
                    if nums[middle] == nums[left] && nums[middle] == nums[right] {
                        left += 1
                        right -= 1
                    } else if nums[left] <= nums[middle] {
                        if nums[left] <= target && target < nums[middle] {
                            right = middle - 1
                        } else {
                            left = middle + 1
                        }
                    } else {
                        if nums[middle] < target && target <= nums[right] {
                            left = middle + 1
                        } else {
                            right = middle - 1
                        }
                    }
                }
            }
            return false
        }
    }
}