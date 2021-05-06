class Solution {
    func decode(_ encoded: [Int], _ first: Int) -> [Int] {
        var result = [first]
        var current = first
        for num in encoded {
            current = current ^ num
            result.append(current)
        }
        return result
    }
}