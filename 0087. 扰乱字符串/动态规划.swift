// 168ms
// 参考：https://leetcode-cn.com/problems/scramble-string/solution/gong-shui-san-xie-yi-ti-san-jie-di-gui-j-hybk/
class Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        guard s1.count == s2.count else {
            return false
        }

        let s1 = Array(s1), s2 = Array(s2)
        let len = s1.count
        var table = [[[Bool]]](
            repeating: [[Bool]](
                repeating: [Bool](repeating: false, count: len + 1),
                count: len
            ),
            count: len
        )

        for i in 0..<len {
            for j in 0..<len {
                table[i][j][1] = (s1[i] == s2[j])
            }
        }

        for k in 1...len {
            for i in 0...(len - k) {
                for j in 0...(len - k) {
                    for s in 1..<k {
                        let xy_xy = table[i][j][s] && table[i + s][j + s][k - s]
                        let xy_yx = table[i][j + k - s][s] && table[i + s][j][k - s]
                        if xy_xy || xy_yx {
                            table[i][j][k] = true
                            break
                        }
                    }
                }
            }
        }

        return table[0][0][len]
    }
}