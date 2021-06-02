// 120ms
var checkSubarraySum = function(nums, k) {
    const len = nums.length
    let map = new Map()
    let accu = 0

    function check(i) {
        let mod = accu % k
        if (map.has(mod)) {
            if (i - map.get(mod) >= 2) {
                return true
            }
        } else {
            map.set(mod, i)
        }
        return false
    }

    for (let i = 0; i < len; i += 1) {
        if (check(i)) {
            return true
        }
        accu += nums[i]
    }
    return check(len)
};