// 字典表，swift 是真的离谱
var table: [Character: Int] = [
    "a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6,
    "h": 7, "i": 8, "j": 9, "k": 10, "l": 11, "m": 12, "n": 13,
    "o": 14, "p": 15, "q": 16, "r": 17, "s": 18, "t": 19,
    "u": 20, "v": 21, "w": 22, "x": 23, "y": 24, "z": 25
]

// 存储开头为 x 的字符串可能出现的长度，这算是一个小优化
// 比如 possibleLens[table["a"]] 表示开头为 "a" 的字符串可能出现的长度
var possibleLens = [Set<Int>]()
(0..<26).forEach {_ in
    possibleLens.append(Set<Int>())
}

class Solution {

    class Trie {
        // 子树、是否允许到头
        var val = [Trie?](repeating: nil, count: 26)
        var isEnd = false

        // 添加单词
        func store(_ s: String) {
            var p = self
            for c in s {
                if p.val[table[c]!] == nil {
                    p.val[table[c]!] = Trie()
                }
                p = p.val[table[c]!]!
            }
            p.isEnd = true
            possibleLens[table[s.first!]!].insert(s.count)
        }

        // 是否匹配
        func isMatch(_ s: ArraySlice<Character>) -> Bool {
            var p = self
            for c in s {
                if let hash = p.val[table[c]!] {
                    p = hash
                } else {
                    return false
                }
            }
            return p.isEnd
        }
        
    }

    func respace(_ dictionary: [String], _ sentence: String) -> Int {
        let trie = Trie(), sentence = Array(sentence)
        for e in dictionary {
            trie.store(e)
        }
        // 这里要注意右侧腾一个位置给边界
        var dp = [Int](repeating: 0, count: sentence.count + 1)
        // 从右侧开始动态规划
        for i in (0..<sentence.count).reversed() {
            // 先初始化最坏情况：新加入的字符串为无法识别的字符
            dp[i] = dp[i + 1] + 1
            let maxLen = sentence.count - i
            // 先抽出开头为 sentence[i] 的字符串的可能的长度
            for len in possibleLens[table[sentence[i]]!].filter({ $0 <= maxLen }) {
                // 如果匹配，则使用动态转移方程
                if trie.isMatch(sentence[i..<(i + len)]) {
                    dp[i] = min(dp[i], dp[i + len])
                }
            }
        }
        return dp[0]
    }
}