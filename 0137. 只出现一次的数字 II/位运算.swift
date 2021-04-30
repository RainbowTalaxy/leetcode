class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0, b = 0
        for num in nums {
            let t_a = (~a & b & num) | (a & ~b & ~num)
            let t_b = ~a & (b ^ num)
            a = t_a
            b = t_b
        }
        return b
    }
}