// 20ms
class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        let S = Array(S), len = S.count
        var mins = [Character:Int](), maxs = [Character:Int]()
        for i in 0..<len {
            if let _ = mins[S[i]] {
                maxs[S[i]] = i
            } else {
                mins[S[i]] = i
                maxs[S[i]] = i
            }
        }
        var start = 0
        var result = [Int]()
        while start < len {
            var checkPoint = start, end = start
            while checkPoint <= end {
                end = max(end, maxs[S[checkPoint]] ?? 0)
                checkPoint += 1
            }
            result.append(end - start + 1)
            start = end + 1
        }
        return result
    }
}