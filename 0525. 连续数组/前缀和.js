// 148ms
var findMaxLength = function(nums) {
    const len = nums.length
    let table = new Array(len + 1).fill()
    let map = new Map()
    let count = 0
    for (let i = 0; i < len; i += 1) {
        let val = 2 * count - i
        if (!map.has(val)) {
            map.set(2 * count - i, i)
        }
        table[i] = count
        count += nums[i] == 0 ? 1 : 0
    }
    map.set(2 * count + len, len)
    table[len] = count

    let result = 0
    for (let r = 1; r <= len; r += 1) {
        let val = 2 * table[r] - r
        if (map.has(val)) {
            result = Math.max(r - map.get(val), result)
        }
    }

    return result
};

// r - l = (table[r] - table[l]) * 2
// table[l] = table[r] - (r - l) / 2
// 2 * table[l] + l = 2 * table[r] - r