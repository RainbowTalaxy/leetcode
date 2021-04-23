// 984ms
class Solution {
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        var maxn = Int.min
        let rowN = matrix.count, colN = matrix[0].count
        for top in 0..<rowN {
            var colSum = [Int](repeating: 0, count: colN)
            for bottom in top..<rowN {
                for col in 0..<colN {
                    colSum[col] += matrix[bottom][col]
                }
                var sumSet = [0]
                var rowSum = 0
                for sum in colSum {
                    rowSum += sum
                    let idx = lowerBound(sumSet, num: rowSum - k)
                    if idx != -1 {
                        maxn = max(maxn, rowSum - sumSet[idx]) 
                    }
                    insert(&sumSet, num: rowSum)
                }
            }
        }
        return maxn
    }

    func insert(_ nums: inout [Int], num: Int) {
        var l = 0, r = nums.count
        while l < r {
            let m = (l + r) / 2
            if nums[m] >= num {
                r = m
            } else {
                l = m + 1
            }
        }
        nums.insert(num, at: l)
    }

    func lowerBound(_ nums: [Int], num: Int) -> Int {
        var l = 0, r = nums.count
        while l < r {
            let m = (l + r) / 2
            if nums[m] >= num {
                r = m
            } else {
                l = m + 1
            }
        }
        return l < nums.count ? l : -1
    }
}