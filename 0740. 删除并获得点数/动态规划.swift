// 52ms
class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var dict: [Int:Int] = [:]
        for num in nums {
            if let count = dict[num] {
                dict[num] = count + 1
            } else {
                dict[num] = 1
            }
        }

        let pairs = dict.sorted { a,b in a.key < b.key }, len = pairs.count
        var table = [[Int]](repeating: [Int](repeating: 0, count: 2), count: len)

        for i in 0..<len {
            let sum = pairs[i].key * pairs[i].value
            if i == 0 {
                table[i][1] = sum
            } else {
                table[i][0] = (table[i-1].max() ?? 0)
                if abs(pairs[i].key - pairs[i-1].key) == 1 {
                    table[i][1] = table[i-1][0] + sum
                } else {
                    table[i][1] = table[i][0] + sum
                }
            }
        }

        return table[len-1].max() ?? 0
    }
}