// 8ms
class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x, result = 0
        while x != 0 {
            result *= 10
            result += x % 10
            x /= 10
        }
        let p2_31 = Int(pow(2, 31).description) ?? 0
        if result > p2_31 - 1 || result < -p2_31 {
            return 0
        }
        return result
    }
}