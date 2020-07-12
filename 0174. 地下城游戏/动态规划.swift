// 64ms
class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let row = dungeon.count, col = dungeon.first!.count
        var table = [[Int]](repeating: [Int](repeating: -1, count: col), count: row)
        table[row - 1][col - 1] = max(1 - (dungeon[row - 1][col - 1]), 1)
        func memory(_ x: Int, _ y: Int) -> Int {
            if x >= row || y >= col {
                return Int.max
            } else {
                if table[x][y] == -1 {
                    table[x][y] = max(min(memory(x + 1, y), memory(x, y + 1)) - dungeon[x][y], 1)
                }
                print(table)
                return table[x][y]
            }
        }
        return memory(0, 0)
    }
}