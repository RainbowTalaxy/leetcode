// 4ms
class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        let name = Array(name)
        var p = 0, pre: Character?
        for c in typed {
            if p >= name.count || c != name[p] {
                if let pre = pre {
                    if c != pre {
                        return false
                    }
                } else {
                    return false
                }
            } else {
                p += 1
            }
            pre = c
        }
        return p == name.count
    }
}