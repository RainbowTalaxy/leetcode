/* 修改自：
    作者：zain-7
    链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/solution/swift-zui-jia-mai-mai-gu-piao-shi-ji-han-leng-dong/
    来源：力扣（LeetCode）
    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/

// 12ms
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var hold = Int.min, rest = 0, sale = 0
        for p in prices {
            let pre_sale = sale
            sale = hold + p
            hold = max(hold, rest - p)
            rest = max(pre_sale, rest)
        }
        return max(rest, sale)
    }
}