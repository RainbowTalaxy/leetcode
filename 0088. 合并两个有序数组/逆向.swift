// 12ms
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1, p2 = n - 1, p = m + n - 1
        while p2 >= 0 {
            if p1 >= 0 {
                if nums1[p1] > nums2[p2] {
                    nums1[p] = nums1[p1]
                    p1 -= 1
                } else {
                    nums1[p] = nums2[p2]
                    p2 -= 1
                }
            } else {
                nums1[p] = nums2[p2]
                p2 -= 1
            }
            p -= 1
        }
    }
}