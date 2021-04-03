// 108ms
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1), text2 = Array(text2)
        var table = [[Int]](repeating: [Int](repeating: 0, count: text2.count), count: text1.count)
        for i in 0..<text1.count {
            for j in 0..<text2.count {
                var option1 = 0, option2 = 0
                if text1[i] == text2[j] {
                    option1 = ((i > 0 && j > 0) ? table[i - 1][j - 1] : 0) + 1
                } else {
                    option2 = max(i > 0 ? table[i - 1][j] : 0, j > 0 ? table[i][j - 1] : 0)
                }
                table[i][j] = max(option1, option2)
            }
        }
        return table.last?.last ?? 0
    }
}