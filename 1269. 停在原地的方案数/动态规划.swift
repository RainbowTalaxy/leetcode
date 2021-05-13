class Solution {
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        let arrLen = min(arrLen, steps + 1)
        // table[step: 0...steps][idx: 0..<arrLen]
        var table = [[Int]](repeating: [Int](repeating: -1, count: arrLen), count: steps + 1)

        func memory(_ step: Int, _ idx: Int) -> Int {
            if idx < 0 || idx >= arrLen {
                return 0
            }
            if table[step][idx] == -1 {
                table[step][idx] = search(step, idx) % 1000000007
            }
            return table[step][idx]
        }

        func search(_ step: Int, _ idx: Int) -> Int {
            if step == steps {
                return idx == 0 ? 1 : 0
            }
            let step = step + 1
            return memory(step, idx - 1) + memory(step, idx) + memory(step, idx + 1)
        }

        return memory(0, 0)
    }
}