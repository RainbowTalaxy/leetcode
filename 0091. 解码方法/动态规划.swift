// 8ms
class Solution {
    func numDecodings(_ s: String) -> Int {
        let s = Array(s)
        var table = [Int](repeating: 0, count: s.count)

        for i in 0..<s.count {
            var cnt = 0
            if s[i] != "0" {
                cnt += (i > 0 ? table[i-1] : 1)
            }
            if i > 0, let num = Int("\(s[i-1])\(s[i])") ?? 0 {
                if num >= 10 && num <= 26 {
                    cnt += (i > 1 ? table[i-2] : 1)
                }
            }
            table[i] = cnt
        }
        print(table)
        return table[s.count - 1]
    }
}

// dp[i] =    (s[i] == '0') ? 0 : dp[i-1]
//          + (s[i-1 to i] is valid) ? dp[i-2] : 0