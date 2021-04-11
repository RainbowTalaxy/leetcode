// 12ms
// 官方题解
class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }

        var table = [Int](repeating: 0, count: n + 1)
        table[1] = 1
        var p2 = 1, p3 = 1, p5 = 1

        for i in 2...n {
            let n2 = table[p2] * 2, n3 = table[p3] * 3, n5 = table[p5] * 5
            let minn = min(min(n2, n3), n5)
            table[i] = minn
            if minn == n2 {
                p2 += 1
            }
            if minn == n3 {
                p3 += 1
            }
            if minn == n5 {
                p5 += 1
            }
        }

        return table[n]
    }
}