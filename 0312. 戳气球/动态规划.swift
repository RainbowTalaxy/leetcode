// 108ms
class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        var nums = [1] + nums + [1]
        var table = [[Int]](repeating: [Int](repeating: 0, count: nums.count), count: nums.count)
        for len in 1...(nums.count - 2) {
            for i in 1...(nums.count - 1 - len) {
                for k in i...(i + len - 1) {
                    table[i][j] = max(
                        table[i][j], 
                        table[i][k - 1] + nums[i - 1] * nums[k] * nums[j + 1]  + table[k + 1][j]
                    );
                }
            }
        }
        return table[1][nums.count - 2]
    }
}