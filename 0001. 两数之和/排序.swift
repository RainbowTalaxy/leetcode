// 48ms
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var sorted = nums.enumerated().map { i in (i.1, i.0) } .sorted { (a, b) in a.0 < b.0 }
        var left = 0, right = nums.count - 1
        while true {
            let result = sorted[left].0 + sorted[right].0
            if result == target {
                print(result)
                return [sorted[left].1, sorted[right].1]
            } else if result > target {
                right -= 1
            } else {
                left += 1
            }
        }
    }
}