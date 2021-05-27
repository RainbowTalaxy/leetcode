// 148ms
var totalHammingDistance = function(nums) {
    let len = nums.length, result = 0
    for (let i = 0; i < 31; i += 1) {
        let one = 0
        for (let num of nums) {
            one += (num >> i & 1)
        }
        result += one * (len - one)
    }
    return result
};