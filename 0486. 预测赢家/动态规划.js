// 88ms
var PredictTheWinner = function(nums) {
    var table = nums.map(_ => [])

    function memory(left, right) {
        if (table[left][right] == undefined) {
            table[left][right] = search(left, right)
        }
        return table[left][right]
    }

    function search(left, right) {
        if (right == left) {
            return [nums[left], 0]
        } else {
            var result1 = memory(left + 1, right), result2 = memory(left, right - 1)
            var pre1 = nums[left] + result1[1], pre2 = nums[right] + result2[1]
            return pre1 >= pre2 ? [pre1, result1[0]] : [pre2, result2[0]]
        }
    }

    var result = memory(0, nums.length - 1)
    return result[0] >= result[1]
};