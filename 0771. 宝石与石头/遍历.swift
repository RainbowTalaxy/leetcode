// 4ms
class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var result = 0
        for jew in J {
            for stone in S {
                if jew == stone {
                    result += 1
                }
            }
        }
        return result
    }
}