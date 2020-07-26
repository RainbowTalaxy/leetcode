// 320ms
class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let row = matrix.count, col = matrix.first?.count ?? 0
        var table = [[Int]](repeating: [Int](repeating: -1, count: col), count: row)

        func memory(_ x: Int, _ y: Int) -> Int {
            if table[x][y] == - 1 {
                table[x][y] = search(x, y)
            }
            return table[x][y]
        }

        func search(_ x: Int, _ y: Int) -> Int {
            var result = 0
            if x > 0 && matrix[x][y] < matrix[x - 1][y] {
                result = max(result, memory(x - 1, y))
            }
            if x < row - 1 && matrix[x][y] < matrix[x + 1][y] {
                result = max(result, memory(x + 1, y))
            }
            if y > 0 && matrix[x][y] < matrix[x][y - 1] {
                result = max(result, memory(x, y - 1))
            }
            if y < col - 1 && matrix[x][y] < matrix[x][y + 1] {
                result = max(result, memory(x, y + 1))
            }
            return result
        }

        var result = 0
        for x in 0 ..< row {
            for y in 0 ..< col {
                result = max(maxn, memory(x, y))
            }
        }

        return result
    }
}