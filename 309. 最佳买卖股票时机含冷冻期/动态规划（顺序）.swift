// 224
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var table = [Int](repeating: 0, count: prices.count)
        for i in 0..<prices.count {
            table[i] = (i > 0 ? table[i - 1] : 0)
            for j in 0..<i {
                table[i] = max(prices[i] - prices[j] + (j > 1 ? table[j - 2] : 0), table[i])
            }
        }
        // 有个坑点，prices可能为空
        return prices.isEmpty ? 0 : table[prices.count - 1]
    }
}