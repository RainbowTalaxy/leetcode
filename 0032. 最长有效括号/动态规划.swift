// 12ms
class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var maxn = 0, str = Array(s)
        var table = [Int](repeating: 0, count: str.count)
        for i in 0..<str.count {
            if str[i] == ")" && i > 0 && i - table[i - 1] > 0 && str[i - table[i - 1] - 1] == "(" {
                table[i] = table[i - 1] + 2 + ((i - table[i - 1]) >= 2 ? table[i - table[i - 1] - 2] : 0);
                maxn = max(maxn, table[i]);
            }
        }
        return maxn
    }
}