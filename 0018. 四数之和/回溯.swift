// 3500ms
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var nums = nums.sorted()
        func search(_ idx: Int, _ target: Int, _ num: Int) -> [[Int]] {
            if num == 1 {
                for i in idx..<nums.count {
                    if nums[i] == target {
                        return [[target]]
                    }
                }
                return [[Int]]()
            } else {
                var result = [[Int]](), pre = Int.max
                for i in idx..<nums.count {
                    var current = nums[i]
                    if current == pre {
                        continue
                    } else {
                        pre = current
                        var pres = search(i + 1, target - current, num - 1)
                        pres.forEach { pre in
                            result.append([current] + pre)
                        }
                    }
                }
                return result
            }
        }
        return search(0, target, 4)
    }
}