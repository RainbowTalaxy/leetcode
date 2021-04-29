// 1696ms
class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        let len = stones.count
        var table = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)
        // table[location][distance]
        table[0][0] = true

        for i in 1..<len {
            if stones[i] - stones[i-1] > i {
                return false
            }
        }

        for i in 1..<len {
            for j in (0..<i).reversed() {
                let k = stones[i] - stones[j]
                if k <= i {
                    if table[j][k] || (k - 1 >= 0 && table[j][k-1]) || (k + 1 < len && table[j][k+1]) {
                        table[i][k] = true
                    }
                } else {
                    break
                }
            }
        }

        return table[len - 1].reduce(false) { a, b in a || b }
    }
}