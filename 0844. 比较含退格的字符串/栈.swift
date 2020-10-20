// 0ms
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        func getStack(_ str: String) -> [Character] {
            var chars = Array(str)
            var stack = [Character]()
            for c in chars {
                if c != "#" {
                    stack.append(c)
                } else if !stack.isEmpty {
                    stack.removeLast()
                }
            }
            return stack
        }
        return getStack(S) == getStack(T)
    }
}