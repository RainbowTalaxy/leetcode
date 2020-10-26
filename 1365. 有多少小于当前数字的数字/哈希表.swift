// 56ms
class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var sorted = nums.sorted()
        var pre = 0, count = 0
        var map = [Int:Int]()
        for num in sorted {
            if num != pre {
                map[num] = count
                pre = num
            }
            count += 1
        }
        var result = [Int]()
        for num in nums {
            result.append(map[num] ?? 0)
        }
        return result
    }
}