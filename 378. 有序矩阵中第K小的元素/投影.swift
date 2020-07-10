class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        // 行列投影信息表
        var projectedVertical = [Int](repeating: -1, count: matrix.count)
        var projectedHorizontal = [Int](repeating: -1, count: matrix.count)

        // 移除投影点（待比较队列中的元素）
        func removeProjectDot(_ x: Int, _ y: Int) {
            projectedVertical[x] = -1
            projectedHorizontal[y] = -1
        }

        // 添加投影点
        func isValidThenProjectDot(_ x: Int, _ y: Int) {
            if x < projectedVertical.count && y < projectedHorizontal.count && projectedVertical[x] == -1 && projectedHorizontal[y] == -1 {
                projectedVertical[x] = y
                projectedHorizontal[y] = x
            }
        }

        // 手动给出初始状态
        projectedVertical[0] = 0
        projectedHorizontal[0] = 0
        var current = 0, value = 0

        while current < k {
            // 寻找最小值
            var minDotX: Int?
            for i in 0..<projectedVertical.count {
                if projectedVertical[i] != -1 {
                    if let x = minDotX {
                        if matrix[projectedVertical[x]][x] > matrix[projectedVertical[i]][i] {
                            minDotX = i
                        }
                    } else {
                        minDotX = i
                    }
                }
            }
            // 将最小值移除，并添加其右和其下的元素
            if let x = minDotX {
                let y = projectedVertical[x]
                value = matrix[y][x]
                current += 1
                removeProjectDot(x, y)
                isValidThenProjectDot(x + 1, y)
                isValidThenProjectDot(x, y + 1)
            }
        }
        
        return value
    }
}

/*

 1  5  9
 2 10 11
 5 12 13

*/