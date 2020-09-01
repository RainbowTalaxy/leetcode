// 1304ms
var PredictTheWinner = function(nums) {
    function winnerData(nums) {
        var p1 = 0, p2 = 0
        if (nums.length == 1) {
            p1 = nums[0]
            return [p1, p2]
        } else {
            var result1 = winnerData(nums.slice(1))
            var result2 = winnerData(nums.slice(0, nums.length - 1)) 
            var pre1 = nums[0] + result1[1]
            var pre2 = nums[nums.length - 1] + result2[1]
            if (pre1 >= pre2) {
                return [pre1, result1[0]]
            } else {
                return [pre2, result2[0]]
            }
        }
    }
    var result = winnerData(nums)
    return result[0] >= result[1]
};
