// 108ms
var combinationSum = function(candidates, target) {
    var result = []
    for (let i in candidates) {
        let num = candidates[i]
        if (num < target) {
            let next = combinationSum(candidates.slice(i), target - num)
            for (let j in next) {
                next[j].unshift(num)
                result.push(next[j])
            }
        } else if (num == target) {
            result.push([num])
        }
    }
    return result
};