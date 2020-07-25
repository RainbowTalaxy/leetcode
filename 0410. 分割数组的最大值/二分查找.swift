// 16ms
class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        var left = 0, right = 0
        for num in nums {
            left = max(left, num)
            right += num
        }
        while left < right {
            int mid = (left + right) / 2, sum = 0, count = 1
            for num in nums {
                sum += num
                if sum > mid {
                    sum = num
                    count += 1
                }
            }
            if count > m {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}