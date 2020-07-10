// 4148ms
class Solution {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        // 动态规划的表
        var table = [[Int]](repeating: [Int](repeating: -1, count: B.count), count: A.count)
        // 动态规划中的记忆函数
        func memory(_ x: Int, _ y: Int) -> Int {
            // 边界处理
            if x < 0 || x >= A.count || y < 0 || y >= B.count {
                return 0
            } else {
                // 如果该状态没有查找过
                if table[x][y] == -1 {
                    // 该题的动态转移方程比较简单，查找函数直接嵌入到记忆函数中
                    // table[x][y] = find(x, y)
                    table[x][y] = A[x] == B[y] ? memory(x - 1, y - 1) + 1 : 0
                }
                return table[x][y]
            }
        }
        // func find(_ x: Int, _ y: Int) -> Int {
        //     return A[x] == B[y] ? memory(x - 1, y - 1) + 1 : 0
        // }
        var maxLength = 0
        // 顺序查表，并找出最大长度
        for x in 0..<A.count {
            for y in 0..<B.count {
                maxLength = max(memory(x, y), maxLength)
            }
        }
        return maxLength
    }
}