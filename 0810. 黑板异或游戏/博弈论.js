// 80ms
var xorGame = function(nums) {
    let s = nums.reduce((a, b) => { return a ^ b }, 0)
    return s == 0 || nums.length % 2 == 0
};