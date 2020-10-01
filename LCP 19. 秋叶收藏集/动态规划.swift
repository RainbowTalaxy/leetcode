// 656ms
class Solution {
    func minimumOperations(_ leaves: String) -> Int {
        var len = leaves.count, colors = Array(leaves)
        var table = [[Int]](repeating: [Int](repeating: 0, count: 3), count: len)
        table[0][0] = colors[0] == "r" ? 0 : 1
        table[0][1] = Int.max
        table[0][2] = Int.max
        table[1][2] = Int.max
        for i in 1..<len {
            table[i][0] = table[i - 1][0] + (colors[i] == "r" ? 0 : 1)
            table[i][1] = min(table[i - 1][0], table[i - 1][1]) + (colors[i] == "r" ? 1 : 0)
            if i > 1 {
                table[i][2] = min(table[i - 1][1], table[i - 1][2]) + (colors[i] == "r" ? 0 : 1)
            }
        }
        return table[len - 1][2]
    }
}