class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var l = 0, r = Int(sqrt(Double(c)))
        while l <= r {
            let sum = l*l + r*r
            if sum == c {
                return true
            } else if sum < c {
                l += 1
            } else {
                r -= 1
            }
        }
        return false
    }
}