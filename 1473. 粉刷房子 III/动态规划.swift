/*

  i: 房号 0..<m
  j: 颜色 1...n，0 未上色
  k: 街区数量 1...m

 */

// 768ms
class Solution {
    func minCost(_ houses: [Int], _ cost: [[Int]], _ m: Int, _ n: Int, _ target: Int) -> Int {
        // int table[m][n+1][target+1]
        var table = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: target + 1), count: n + 1), count: m)

        // i: house, j: color, k: district
        func memory(_ i: Int, _ j: Int, _ k: Int) -> Int {
            if k > i + 1 {                      // invalid district number
                return Int.max
            }
            if i < 0 {                          // initial value
                return 0
            }
            if j < 1 ||  k < 1 {                // invalid boundary  
                return Int.max
            }
            if table[i][j][k] == -1 {
                table[i][j][k] = search(i, j, k)
            }
            return table[i][j][k]
        }

        func search(_ i: Int, _ j: Int, _ k: Int) -> Int {
            if houses[i] != 0 {                 // has been painted
                if j != houses[i] {             // invalid paint
                    return Int.max
                }
                var result = memory(i-1, j, k)  // same district
                for p in 1...n {
                    if p != j {                 // i color should be different from i-1
                        result = min(result, memory(i-1, p, k-1))
                    }
                }
                return result
            } else {                            // not been painted
                var result = memory(i-1, j, k)
                for p in 1...n {
                    if p != j {
                        result = min(result, memory(i-1, p, k-1))
                    }
                }
                if result == Int.max {          // check if invalid
                    return result
                }
                return result + cost[i][j-1]
            }
        }
        var result = Int.max
        for i in 1...n {                        // search for every color
            result = min(result, memory(m-1, i, target))
        }
        return result == Int.max ? -1 : result
    }
}