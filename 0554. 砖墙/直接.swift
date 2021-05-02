// 280ms
class Solution {
    func leastBricks(_ wall: [[Int]]) -> Int {
        var counts: [Int: Int] = [:]
        for row in wall {
            var sum = 0
            for brick in row {
                if sum != 0 {
                    if let count = counts[sum] {
                        counts[sum] = count + 1
                    } else {
                        counts[sum] = 1
                    }
                }
                sum += brick
            }
        }
        return wall.count - (counts.values.max() ?? 0)
    }
}