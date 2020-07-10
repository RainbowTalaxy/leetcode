// 388ms
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var table = [Int](repeating: -1, count: prices.count)
        func memory(_ x: Int) -> Int {
            // 边界处理
            if x < 0 {
                return 0
            } else {
                if table[x] == -1 {
                    table[x] = search(x)
                }
                return table[x]
            }
        }
        func search(_ x: Int) -> Int {
            var result = memory(i - 1)
            for i in 0..<x {
                // 动态转移方程
                result = max(prices[x] - prices[i] + memory(i - 1), result)
            }
            return result
        }
        return memory(prices.count)
    }
}

