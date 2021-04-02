// 32ms
class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var leftMax = 0, rightMax = 0
        var result = 0
        while left < right {
            leftMax = max(leftMax, height[left])
            rightMax = max(rightMax, height[right])
            if height[left] > height[right] {
                result += rightMax - height[right]
                right -= 1
            } else {
                result += leftMax - height[left]
                left += 1
            }
        }
        return result
    }
}