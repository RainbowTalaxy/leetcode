// 676ms
class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        let len = arr.count
        var table = [Int](repeating: 0, count: len)
        var accu = 0
        for i in 0..<len {
            accu = accu ^ arr[i]
            table[i] = accu
        }
        var result: [Int] = []
        for q in queries {
            result.append((q[0] == 0 ? 0 : table[q[0] - 1]) ^ table[q[1]])
        }
        return result
    }
}