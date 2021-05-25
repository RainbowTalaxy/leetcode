// 644ms
var minChanges = function(nums, k) {
    const len = nums.length
    let prevCol = new Array(1024).fill(Number.MAX_VALUE)
    prevCol[0] = 0

    for (let col = 0; col < k; col += 1) {
        let map = new Map(), count = 0
        for (let i = col; i < len; i += k) {
            let n = nums[i]
            map.set(n, map.has(n) ? map.get(n) + 1 : 1)
            count += 1
        }
        let minn = Math.min(...prevCol)
        let currCol = new Array(1024).fill(minn)
        for (let n = 0; n < 1024; n += 1) {
            for (let [key, val] of map.entries()) {
                currCol[n] = Math.min(currCol[n], prevCol[n^key] - val)
            }
        }

        prevCol = currCol.map(i => i + count)
    }

    return prevCol[0]
};