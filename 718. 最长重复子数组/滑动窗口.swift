// 296ms
class Solution {
    func search(_ A: [Int], _ B: [Int]) -> Int {
        var maxLength = 0
        for i in 0..<A.count {
            var length = 0
            for k in 0..<min(A.count - i, B.count) {
                if A[i + k] == B[k] {
                    length += 1
                } else {
                    maxLength = max(maxLength, length)
                    length = 0
                }
            }
            maxLength = max(maxLength, length)
        }
        return maxLength
    }
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        return max(search(A, B), search(B, A))
    }
}