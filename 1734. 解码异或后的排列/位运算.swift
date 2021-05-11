/*
    由于 encoded[i] = perm[i] ^ perm[i+1]
    所以，令：
    y = perm[1] ^ perm[2] ^ perm[3] ^ ... ^ perm[n-1]
      = encoded[1] ^ encoded[3] ^ ... ^ encoded[n-2]

    同时我们可以算出 1...n 的异或结果，令：
    x = perm[0] ^ perm[1] ^ perm[2] ^ ... ^ perm[n-1]
    得出：
    perm[0] = x ^ y

    然后根据 perm[0] 对 encoded 依次异或即可
*/
// 1892ms
class Solution {
    func decode(_ encoded: [Int]) -> [Int] {
        let len = encoded.count
        var y = 0
        for i in stride(from: 1, to: len, by: 2) {
            y = y ^ encoded[i]
        }
        var x = 0
        for i in 1...(len+1) {
            x = x ^ i
        }
        var perm: [Int] = [], current = x ^ y
        perm.append(current)
        for n in encoded {
            current = current ^ n
            perm.append(current)
        }
        return perm
    }
}