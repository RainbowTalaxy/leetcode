// 68ms
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var row = grid.count, col = grid.first?.count ?? 0
        var table = [Int](repeating: 0, count: col)
        for i in 0 ..< row {
            if i == 0 {
                for j in 0 ..< col {
                    if j == 0 {
                        table[j] = grid[i][j]
                    } else {
                        table[j] = table[j - 1] + grid[i][j]
                    }
                }
            } else {
                for j in 0 ..< col {
                    if j == 0 {
                        table[j] += grid[i][j]
                    } else {
                        table[j] = min(table[j], table[j - 1]) + grid[i][j]
                    }
                }
            }
        }
        print(table)
        return table[col - 1]
    }
}