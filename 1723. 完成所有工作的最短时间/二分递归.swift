// 56ms
class Solution {
    func minimumTimeRequired(_ jobs: [Int], _ k: Int) -> Int {
        let len = jobs.count
        var l = jobs.max()!, r = jobs.reduce(0, +)
        
        func check(_ capacity: Int) -> Bool {
            var table = [Int](repeating: 0, count: k)

            func next(_ j: Int) -> Bool {
                guard j < len else {
                    return true
                }

                var result = false
                for i in 0..<k {
                    if table[i] + jobs[j] <= capacity {
                        table[i] += jobs[j]
                        result = result || next(j+1)
                        table[i] -= jobs[j]
                        if table[i] == 0 {
                            break
                        }
                    }
                }
                return result
            }

            return next(0)
        }

        while l < r {
            let m = (l + r) / 2
            if check(m) {
                r = m
            } else {
                l = m + 1
            }
        }

        return l
    }
}