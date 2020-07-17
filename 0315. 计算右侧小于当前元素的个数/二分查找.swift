class Solution {
    var table = [Int.max]

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
        while left < right {
            var mid = (left + right) / 2
            if val > table[mid] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        table.insert(val, at: right)
        return right
    }
}