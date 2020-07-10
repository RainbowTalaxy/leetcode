// 24ms
class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var left = 0, right = 0, maxn = 0
        for c in s {
            c == "(" ? (left += 1) : (right += 1)
            if left == right {
                maxn = max(maxn, left * 2)
            } else if right > left {
                left = 0
                right = 0
            }
        }
        left = 0
        right = 0
        for c in s.reversed() {
            c == ")" ? (left += 1) : (right += 1)
            if left == right {
                maxn = max(maxn, left * 2)
            } else if right > left {
                left = 0
                right = 0
            }
        }
        return maxn
    }
}