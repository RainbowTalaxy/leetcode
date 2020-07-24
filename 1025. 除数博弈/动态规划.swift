class Solution {
    func divisorGame(_ N: Int) -> Bool {
        var result = [Bool](repeating: false, count: N + 1)
        for i in 1 ... N {
            for j in 1 ..< i {
                if i % j == 0 && !result[i - j] {
                    result[i] = true
                    break
                }
            }
        }
        return result[N]
    }
}