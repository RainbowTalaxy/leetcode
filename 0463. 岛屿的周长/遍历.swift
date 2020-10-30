// 592ms
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var result = 0
        var pos = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var row = grid.count, col = row == 0 ? 0 : grid[0].count
        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == 1 {
                    for (x, y) in pos {
                        let newX = i + x, newY = j + y
                        if (newX < 0 || newX >= row || newY < 0 || newY >= col) || grid[newX][newY] == 0 {
                            result += 1
                        }
                    }
                }
            }
        }
        return result
    }
}