// 52ms
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1 = nums1.sorted(), nums2 = nums2.sorted()
        var len1 = nums1.count, len2 = nums2.count, p1 = 0, p2 = 0
        var result = [Int]()
        while p1 < len1 && p2 < len2 {
            if nums1[p1] == nums2[p2] {
                result.append(nums1[p1])
                p1 += 1
                p2 += 1
            } else if nums1[p1] < nums2[p2] {
                p1 += 1
            } else if nums1[p1] > nums2[p2] {
                p2 += 1
            }
        }
        return result
    }
}