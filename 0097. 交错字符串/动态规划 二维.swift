// 20ms 优化后可达8ms
class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let s1 = Array(s1), s2 = Array(s2), s3 = Array(s3), row = s1.count, col = s2.count
        guard s1.count + s2.count == s3.count else {
            return false
        }
        var table = [[Bool]](repeating: [Bool](repeating: false, count: col + 1), count: row + 1)
        table[0][0] = true
        for i in 0...row {
            for j in 0...col {
                var result = table[i][j]
                if i > 0 && s1[i - 1] == s3[i + j - 1] {
                    result = result || table[i - 1][j]
                }
                if j > 0 && s2[j - 1] == s3[i + j - 1] {
                    result = result || table[i][j - 1]
                }
                table[i][j] = result
            }
        }
        return table[row][col]
    }
}
