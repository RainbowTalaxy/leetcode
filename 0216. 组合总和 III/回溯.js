// 76ms
var combinationSum3 = function (k, n) {
    function combinationSum(index, rest, k) {
        var result = []
        for (let i = index; i <= 9; i += 1) {
            if (i < rest && k > 1) {
                let next = combinationSum(i + 1, rest - i, k - 1)
                for (let j = 0, len = next.length; j < len; j += 1) {
                    next[j].unshift(i)
                    result.push(next[j])
                }
            } else if (i == rest && k == 1) {
                result.push([i])
            }
        }
        return result
    }
    return combinationSum(1, n, k)
};