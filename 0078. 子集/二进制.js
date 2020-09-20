// 104ms
var subsets = function(nums) {
    var result = [], len = nums.length
    const end = Math.pow(2, len)
    for (let i = 0; i < end; i += 1) {
        let p = [], t = i
        for (let j = 0; j < len; j += 1) {
            if (t & 1 == 1) {
                p.push(nums[j])
            }
            t >>= 1
        }
        result.push(p)
    }
    return result
};