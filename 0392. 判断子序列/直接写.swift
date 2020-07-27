// 8ms
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var s = Array(s), len = s.count
        var index = 0
        for c in t {
            if index < len {
                if c == s[index] {
                    index += 1
                }
            } else {
                break
            }
        }
        return index == len
    }
}