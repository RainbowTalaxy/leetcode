// 168ms
class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        let nums = nums.sorted(), len = nums.count
        var table = [Int](repeating: 1, count: len)

        for i in 0..<len {
            for j in 0..<i {
                if nums[i] % nums[j] == 0 {
                    table[i] = max(table[j] + 1, table[i])
                }
            }
        }

        var currentCount = 0, preIndex = 0
        for i in 0..<len {
            if currentCount < table[i] {
                preIndex = i
                currentCount = table[i]
            }
        }
        currentCount -= 1
        
        var result = [nums[preIndex]]
        func getNext() {
            if currentCount <= 0 {
                return
            }
            for i in (0..<preIndex).reversed() {
                if table[i] == currentCount && nums[preIndex] % nums[i] == 0 {
                    currentCount -= 1
                    preIndex = i
                    result.append(nums[i])
                }
            }
        }

        getNext()

        return result
    }
}