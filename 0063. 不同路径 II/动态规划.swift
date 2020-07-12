class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var row = obstacleGrid.count, col = obstacleGrid.first?.count ?? 0
        var table = [[Int]](repeating: [Int](repeating: -1, count: col), count: row)
        // 记忆函数，值管理，同时处理边界
        func memory(_ x: Int, _ y: Int) -> Int {
            if x < 0 || y < 0 {
                return 0
            } else {
                if table[x][y] == -1 {
                    // 动态转移方程
                    table[x][y] = obstacleGrid[x][y] == 1 ? 0 : memory(x - 1, y) + memory(x, y - 1)
                }
                return table[x][y]
            }
        }
        // 设置初始点状态
        table[0][0] = obstacleGrid[0][0] == 0 ? 1 : 0
        return memory(row - 1, col - 1)
    }
}