class Solution {
    func divingBoard(_ shorter: Int, _ longer: Int, _ k: Int) -> [Int] {
        var current = shorter * k, det = longer - shorter
        var result: [Int] = k == 0 ? [] : [current]
        if det != 0 {
            for _ in 0..<k {
                current += det
                result.append(current)
            }
        }
        return result
    }
}