// 100ms
class Solution {
    var table = [Int]()

    func countSmaller(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        for num in nums.reversed() {
            result.append(findAndInsert(num))
        }
        result.reverse()
        return result
    }

    func findAndInsert(_ val: Int) -> Int {
        var left = 0, right = table.count - 1
        while right - left > 1 {
            var mid = (left + right)
            if val < table[mid] {
                right = mid
            } else {
                left = mid
            }
        }
        table.insert(val, at: right)
        return right
    }
}