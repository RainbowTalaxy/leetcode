// 来源：https://leetcode-cn.com/problems/subsets/solution/javascript-yi-xing-dai-ma-by-suan-huang-suan-ge/
// 88ms
var subsets = function(nums) {
    return nums.reduce((total, num) => 
        total.concat(
            total.map(item => item.concat(num))
        ), [[]]
    )
};