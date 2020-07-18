// !超时
class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let s1 = Array(s1), s2 = Array(s2), s3 = Array(s3)
        func checkNext(_ p1: Int, _ p2: Int) -> Bool {
            let p3 = p1 + p2
            guard p3 < s3.count else {
                return true
            }
            var flag = false
            if p1 < s1.count && s1[p1] == s3[p3] {
                flag = flag || checkNext(p1 + 1, p2)
            }
            if !flag && p2 < s2.count && s2[p2] == s3[p3] {
                flag = flag || checkNext(p1, p2 + 1)
            }
            return flag
        }
        return (s1.count + s2.count) == s3.count && checkNext(0, 0)
    }
}