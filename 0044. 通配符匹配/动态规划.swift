class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var target = Array(s), regex = [Character](), flag = false
        // 压缩 p 中多余的 "*"
        for c in p {
            if !(c == "*" && flag) {
                regex.append(c)
            }
            flag = c == "*"
        }
        // 访问表和记忆表
        var visit = [[Bool]](repeating: [Bool](repeating: false, count: target.count), count: regex.count)
        var table = [[Bool]](repeating: [Bool](repeating: false, count: target.count), count: regex.count)
        // 记忆函数，同时处理边界问题
        func memory(_ x: Int, _ y: Int) -> Bool {
            if x == -1 && y == -1 {
                return true
            } else if x == -1 {
                return false
            } else if y == -1 {
                return x == 0 && regex[0] == "*"
            } else {
                if !visit[x][y] {
                    table[x][y] = search(x, y)
                    visit[x][y] = true
                }
                return table[x][y]
            }
        }
        // 查找函数，放置动态转移方程
        func search(_ x: Int, _ y: Int) -> Bool {
            if regex[x] == "?" || regex[x] == target[y] {
                return memory(x - 1, y - 1)
            } else if regex[x] == "*" {
                return memory(x - 1, y) || memory(x, y - 1)
            } else {
                return false
            }
        }
        return memory(regex.count - 1, target.count - 1)
    }
}