// 52ms
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        for i in 0..<numbers.count {
            var left = i + 1, right = numbers.count, n = target - numbers[i]
            while left <= right {
                let mid = (left + right) / 2
                if n == numbers[mid] {
                    return [i + 1, mid + 1]
                } else if n < numbers[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return [0, 0]
    }
}