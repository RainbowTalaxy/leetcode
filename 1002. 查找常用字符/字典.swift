// 256ms
class Solution {
    func commonChars(_ A: [String]) -> [String] {
        var result = [Character: Int]()
        var alphas = "abcdefghijklmnopqrstuvwxyz"
        alphas.forEach {
            result[$0] = Int.max
        }
        for string in A {
            var dict = [Character: Int]()
            var chars = Array(string)
            for c in chars {
                if dict[c] != nil {
                    dict[c]! += 1
                } else {
                    dict[c] = 1
                }
            }
            for (c, time) in dict {
                if result[c]! != -1 {
                    result[c] = min(result[c]!, dict[c]!)
                }
                alphas.forEach {
                    if (dict[$0] == nil) {
                        result[$0] = -1
                    }
                }
            }
        }
        var rest = [String]()
        for (c, time) in result {
            if time != Int.max && time != -1 {
                for i in 0..<time {
                    rest.append(c.description)
                }
            }
        }
        return rest
    }
}