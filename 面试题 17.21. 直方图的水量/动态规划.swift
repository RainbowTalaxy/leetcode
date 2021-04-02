// 40ms
// 官方题解 - 动态规划
class Solution {
    func trap(_ height: [Int]) -> Int {
        let maxHeight = height.max() ?? 0

        var levels = [Int](repeating: 0, count: height.count)
        var maxn = 0

        for i in 0..<height.count {
            if height[i] > maxn {
                maxn = height[i]
            }
            levels[i] = maxn
        }

        maxn = 0
        for i in (0..<height.count).reversed() {
            if height[i] > maxn {
                maxn = height[i]
            }
            levels[i] = min(maxn, levels[i])
        }

        var result = 0
        for i in 0..<height.count {
            result += levels[i] - height[i]
        }

        return result
    }
}