class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let big = nums
            .map { num in num.description }
            .sorted { n1, n2 in
                n1 + n2 > n2 + n1
            }
            .joined()
        for c in big {
            if c != "0" {
                return big
            }
        }
        return "0"
    }
}