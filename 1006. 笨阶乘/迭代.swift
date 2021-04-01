// 4ms
class Solution {
    func clumsy(_ N: Int) -> Int {
        var neg = false
        var n = N, step = 0
        var result = 0, store = 1
        while n > 0 {
            switch step {
            case 0:
                store = n
            case 1:
                store *= n
            case 2:
                store /= n
            default:
                result += n + store * (neg ? -1 : 1)
                store = 1
                neg = true
            }
            step = (step + 1) % 4
            n -= 1
        }
        if step != 0 {
            result += store * (neg ? -1 : 1)
        }
        return result
    }
}