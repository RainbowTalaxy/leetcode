// 768ms
class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        let len = stones.count
        var check = [[Bool]](repeating: [Bool](repeating: true, count: len), count: len)
        var table = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)

        func memory(_ distance: Int, from idx: Int) -> Bool {
            if check[distance][idx] {
                check[distance][idx] = false
                table[distance][idx] = search(distance, from: idx)
            }
            return table[distance][idx]
        }

        func search(_ distance: Int, from idx: Int) -> Bool {
            if idx >= len - 1 {
                return true
            } else {
                let after = distance + stones[idx]
                for i in (idx + 1)..<len {
                    if abs(stones[i] - after) <= 1 {
                        if memory(stones[i] - stones[idx], from: i) {
                            return true
                        }
                    }
                }
                return false
            }
        }

        return memory(0, from: 0)
    }
}