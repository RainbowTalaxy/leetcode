// 316ms
class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var A = A.map { abs($0) }
        var result = [Int]()
        var left = 0, right = A.count - 1
        while left <= right {
            if A[left] <= A[right] {
                result.append(A[right] * A[right])
                right -= 1
            } else {
                result.append(A[left] * A[left])
                left += 1
            }
        }
        return result.reversed()
    }
}