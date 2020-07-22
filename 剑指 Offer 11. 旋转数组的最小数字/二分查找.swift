// 44ms
class Solution {
    func minArray(_ numbers: [Int]) -> Int {
        var left = 0, right = numbers.count - 1
        while left < right {
            let mid = (left + right) / 2
            if numbers[mid] > numbers[right] {
                left = mid + 1
            } else if numbers[mid] < numbers[right] {
                right = mid
            } else {
                right -= 1
            }
        }
        return numbers[left]
    }
}