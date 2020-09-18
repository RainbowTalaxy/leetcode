// 108ms
var permuteUnique = function (nums) {
    nums.sort()
    function combine(nums) {
        let result = [], len = nums.length, pre = undefined
        if (len == 1) {
            result.push([nums[0]])
        } else {
            for (let i = 0; i < len; i += 1) {
                if (nums[i] != pre) {
                    pre = nums[i]
                    let deleted = Array.from(nums)
                    deleted.splice(i, 1)
                    let next = combine(deleted)
                    next.forEach(i => {
                        i.unshift(pre)
                        result.push(i)
                    })
                }
            }
        }
        return result
    }
    return combine(nums)
};