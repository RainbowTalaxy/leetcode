class Solution {
    typealias Point = (Int, Int)

    func minimalSteps(_ maze: [String]) -> Int {
        let row = maze.count, col = maze.first?.count ?? 0, maze = maze.map { Array($0) }
        
        // 找出所有的 机关M、石头O ，以及 起点S、终点T
        var Ms = [Point](), Os = [Point](), S = (0, 0), T = (0, 0)
        for i in 0 ..< row {
            for j in 0 ..< col {
                switch maze[i][j] {
                case "S":
                    S = (i, j)
                case "T":
                    T = (i, j)
                case "O":
                    Os.append((i, j))
                case "M":
                    Ms.append((i, j))
                default:
                    continue
                }
            }
        }

        func bfs(_ p: Point) -> [[Int]] {
            var distances = [[Int]](repeating: [Int](repeating: Int.max, count: col), count: row)
            distances[p.0][p.1] = 0
            var queue = [p]
            while !queue.isEmpty {
                let (x, y) = queue.removeFirst(), cost = distances[x][y] + 1
                if x > 0 && cost < distances[x - 1][y] && maze[x - 1][y] != "#" {
                    distances[x - 1][y] = cost
                    queue.append((x - 1, y))
                }
                if x < row - 1 && cost < distances[x + 1][y] && maze[x + 1][y] != "#" {
                    distances[x + 1][y] = cost
                    queue.append((x + 1, y))
                }
                if y > 0 && cost < distances[x][y - 1] && maze[x][y - 1] != "#" {
                    distances[x][y - 1] = cost
                    queue.append((x, y - 1))
                }
                if y < col - 1 && cost < distances[x][y + 1] && maze[x][y + 1] != "#" {
                    distances[x][y + 1] = cost
                    queue.append((x, y + 1))
                }
            }
            return distances
        }
        
        // 求出 S-T ，S-O ，M-O ，M-T 的最短距离
        // 行: [S, M1, M2, M3, ..., Mn]
        // 列: [T, O1, O2, O3, ..., On]
        Ms.insert(S, at: 0)
        Os.insert(T, at: 0)
        var minDistances = [[Int]](repeating: [Int](repeating: 0, count: Os.count), count: Ms.count)
        for (i, m) in Ms.enumerated() {
            let distances = bfs(m)
            for (j, o) in Os.enumerated() {
                minDistances[i][j] = distances[o.0][o.1]
            }
        }
        
        // 求出 S-O-M ，M-O-M 的最短距离
        var M_O_M_distances = [[Int]](repeating: [Int](repeating: 0, count: Ms.count), count: Ms.count)
        for x in 0 ..< Ms.count {
            for y in x ..< Ms.count {
                if x != y {
                    var minn = Int.max
                    for oi in 1 ..< Os.count {
                        if minDistances[x][oi] != Int.max && minDistances[y][oi] != Int.max {
                            minn = min(minn, minDistances[x][oi] + minDistances[y][oi])
                        }
                    }
                    M_O_M_distances[x][y] = minn
                    M_O_M_distances[y][x] = minn
                }
            }
        }
        
        // 判断是否 S 和 每个M 都能到达终点，同时每个 S-O-M 是可行的（即 每个M 都能拿到石头）
        for i in 0 ..< Ms.count {
            if minDistances[i][0] == Int.max || M_O_M_distances[0][i] == Int.max {
                return -1
            }
        }
        
        // 动态规划
        var table = [[Int]](repeating: [Int](repeating: -1, count: Ms.count), count: 1 << Ms.count)
        table[1][0] = 0
        
        func memory(_ x: Int, _ y: Int) -> Int {
            if table[x][y] == -1 {
                table[x][y] = search(x, y)
            }
            return table[x][y]
        }
        
        func search(_ x: Int, _ y: Int) -> Int {
            if x % 2 == 0 || (x != 1 && y == 0) {
                return Int.max
            }
            
            let bit = 1 << y, pre = x ^ bit
            var minn = Int.max
            for m in 0 ..< Ms.count {
                let valid = (1 << m) & x
                if valid > 0 && m != y && memory(pre, m) != Int.max {
                    minn = min(memory(pre, m) + M_O_M_distances[m][y], minn)
                }
            }
            return minn
        }
        
        var minn = Int.max, all = (1 << Ms.count) - 1
        for i in 0 ..< Ms.count {
            if memory(all, i) != Int.max {
                minn = min(memory(all, i) + minDistances[i][0], minn)
            }
        }
        
        return minn
    }
}