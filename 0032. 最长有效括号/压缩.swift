// 204ms
class Solution {

    enum Bracket {
        // 左括号、右括号、有效括号长度
        case left, right
        case valid(Int)
    }

    func longestValidParentheses(_ s: String) -> Int {
        var brackets = zip(convert(s))
        var max = 0
        // 找出括号列表中最长的有效括号长度
        for bracket in brackets {
            switch bracket {
                case .valid(let length):
                    if max < length {
                        max = length
                    }
                default:
                    continue
            }
        }
        return max
    }

    // 将字符串转为括号列表
    func convert(_ str: String) -> [Bracket] {
        var result = [Bracket]()
        for c in str {
            if c == "(" {
                result.append(.left)
            } else if c == ")" {
                result.append(.right)
            }
        }
        return result
    }

    // 压缩括号列表
    func zip(_ brackets: [Bracket]) -> [Bracket] {
        var result = brackets
        while true {
            var leftOn = false, preLength = 0
            var reduceBracket = [Bracket]()
            for bracket in result {
                switch bracket {
                    case .left:
                        if leftOn {
                            reduceBracket.append(.left)
                            if preLength > 0 {
                                reduceBracket.append(.valid(preLength))
                            }
                        }
						leftOn = true
                        preLength = 0
                    case .valid(let length):
                        preLength += length
                    case .right:
                        if leftOn {
                            reduceBracket.append(.valid(preLength + 2))
                            leftOn = false
                        } else {
                            if preLength > 0 {
                                reduceBracket.append(.valid(preLength))
                            }
                            reduceBracket.append(.right)
                        }
                        preLength = 0
                }
            }
            // 处理残余状态
			if leftOn {
				reduceBracket.append(.left)
			}
			if preLength > 0 {
                reduceBracket.append(.valid(preLength))
            }
            print(reduceBracket)
            if reduceBracket.count == result.count {
                return result
            } else {
                result = reduceBracket
            }
        }
    }
}