// 20ms
class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var cols = Set<Int>(), dia1 = Set<Int>(), dia2 = Set<Int>()
        var result = 0

        func search(_ row: Int) {
            if (row == n) {
                result += 1
            } else {
                for col in 0..<n {
                    if !cols.contains(col) && !dia1.contains(row + col) && !dia2.contains(row - col) {
                        cols.insert(col)
                        dia1.insert(row + col)
                        dia2.insert(row - col)
                        search(row + 1)
                        cols.remove(col)
                        dia1.remove(row + col)
                        dia2.remove(row - col)
                    }
                }
            }
        }

        search(0)
        return result
    }
}