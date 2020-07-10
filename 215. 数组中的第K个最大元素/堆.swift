class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = nums
        // 从最后一个非叶子节点开始，根据 method 调整堆
        // 题目中要求为大顶堆，则 method 为 '>='
        for i in (0..<(heap.count / 2)).reversed() {
            sink(&heap, from: i, by: >=)
        }
        var max = 0
        for i in 0..<k {
            // 大顶堆的第一个值即为最大值
            max = heap[0]
            if heap.count > 1 {
                // 删除最后一个元素，并把其值赋给根节点
                heap[0] = heap.removeLast()
                // 修改后需要调整堆
                sink(&heap, from: 0, by: >=)
            }
        }
        return max
    }

    // 从某个结点开始，递归调整堆
    func sink(_ nums: inout [Int], from index: Int, by method: (Int, Int) -> Bool) {
        var index = index
        // 确保边界安全
        while index < nums.count {
            var leftChild = index * 2 + 1, rightChild = leftChild + 1
            if leftChild < nums.count {
                if rightChild < nums.count {
                    // 若 method 为 >，则意思为：
                    // 如果 index的左孩子的值大于 index的值 以及 右孩子的值
                    // 则将 index的左孩子 和 index 进行值交换
                    if method(nums[leftChild], nums[index]) && method(nums[leftChild], nums[rightChild]) {
                        nums.swapAt(leftChild, index)
                        index = leftChild
                    } else if method(nums[rightChild], nums[index]) && method(nums[rightChild], nums[leftChild]) {
                        nums.swapAt(rightChild, index)
                        index = rightChild
                    } else { return }
                } else {
                    if method(nums[leftChild], nums[index]) {
                        nums.swapAt(leftChild, index)
                        index = leftChild
                    } else { return }
                }
            } else { return }
        }
    }
}