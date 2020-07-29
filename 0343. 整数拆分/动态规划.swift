// 8ms
class Solution {
    func integerBreak(_ n: Int) -> Int {
        var table = [Int](repeating: 0, count: n + 1)
        table[1] = 1
        for i in 1 ... n {
            var maxn = table[i]
            for j in 1 ..< i {
                maxn = max(max(table[j], j) * (i - j), maxn)
            }
            table[i] = maxn
        }
        return table[n]
    }
}