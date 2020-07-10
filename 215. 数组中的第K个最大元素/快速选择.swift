class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var left = 0, right = nums.count - 1
        while true {
            // 获取一个数值确定的位置
            let position = getARightPosition(&nums, from: left, to: right, by: >=)
            // 如果这个位置就是所要求的 k - 1
            // 直接输出该值
            if position == k - 1 {
                return nums[k - 1]
            } else if position < k - 1 && position != -1 {
                left = position + 1
            } else if position > k - 1 {
                right = position - 1
            }
        }
    }

    // 该方法用来获得数组中一个数值确定的位置
    func getARightPosition(_ nums: inout [Int], from: Int, to: Int, by method: (Int, Int) -> Bool) -> Int {
        // 确保边界安全
        guard from < to else { return -1 }
        // 和快速排序中一样，pivot 是支点
        var left = from, right = to, pivot = nums[from]
        while left < right {
            while left < right && method(pivot, nums[right]) { right -= 1 }
            nums[left] = nums[right]
            while left < right && method(nums[left], pivot) { left += 1 }
            nums[right] = nums[left]
        }
        // 保证：nums中下标left所对应的值必定是pivot
        nums[left] = pivot
        return left
    }
}