class Solution {
    func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
        var l = weights.max()!, r = weights.reduce(0, +)
        
        func checkSatisfied(_ capacity: Int) -> Bool {
            var sum = 0, count = 0
            for weight in weights {
                if sum + weight > capacity {
                    count += 1
                    if count > D {
                        return false
                    }
                    sum = weight
                } else {
                    sum += weight
                }
            }
            if sum > 0 {
                count += 1
            }
            return count <= D
        }

        while l < r {
            let m = (l + r) / 2
            if checkSatisfied(m) {
                r = m
            } else {
                l = m + 1
            }
        }

        return l
    }
}