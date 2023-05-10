// 二分插入
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