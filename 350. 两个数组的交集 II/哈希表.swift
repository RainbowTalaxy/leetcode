// 36ms
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int](), result = [Int]()
        for i in nums1 {
            dict[i] = (dict[i] ?? 0) + 1
        }
        for i in nums2 {
            if let n = dict[i], n > 0 {
                dict[i] = n - 1
                result.append(i)
            }
        }
        return result
    }
}