// 4ms
class Solution {
    func numTrees(_ n: Int) -> Int {
        var table = [Int](repeating: 1, count: n + 1)
        if n > 1 {
            for x in 2 ... n {
                var result = 0, r = x - 1
                for i in 0 ... ((r - 1) / 2) {
                    result += table[i] * table[r - i]
                }
                result *= 2
                if r % 2 == 0 {
                    result += table[r / 2] * table[r / 2]
                }
                table[x] = result
            }
        }
        return table[n]
    }
}