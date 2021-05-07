class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        var nums = (0..<n).map { start + 2 * $0 }
        return nums.reduce(0) { $0 ^ $1 }
    }
}