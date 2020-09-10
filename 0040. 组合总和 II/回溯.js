// 96ms
var combinationSum2 = function(candidates, target) {
    function combinationSum(candidates, target) {
        var result = []
        for (let i = 0; i < candidates.length; i += 1) {
            let num = candidates[i]
            if (num < target) {
                let next = combinationSum(candidates.slice(i + 1), target - num)
                for (let j in next) {
                    next[j].unshift(num)
                    result.push(next[j])
                }
            } else if (num == target) {
                result.push([num])
            }
            while (candidates[i] == candidates[i + 1]) {
                i += 1;
            }
        }
        return result
    }
    candidates.sort()
    return combinationSum(candidates, target)
};