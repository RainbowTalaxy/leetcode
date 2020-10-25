// 212ms
class Solution {
    func longestMountain(_ A: [Int]) -> Int {
        var maxn = 0, count = 0
        var pre = Int.max, isDown = false
        for height in A {
            if pre < height {
                if isDown {
                    isDown = false
                    maxn = max(maxn, count)
                    count = 1
                } else {
                    count += 1
                }
            } else if pre > height {
                if isDown {
                    count += 1
                } else if count > 0 {
                    isDown = true
                    count += 1
                }
            } else {
                if isDown {
                    isDown = false
                    maxn = max(maxn, count)
                }
                count = 0
            }
            pre = height
        }
        if isDown {
            isDown = false
            maxn = max(maxn, count)
        }
        return maxn >= 2 ? maxn + 1 : 0
    }
}