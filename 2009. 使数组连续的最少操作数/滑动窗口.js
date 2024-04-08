/**
 * @param {number[]} nums
 * @return {number}
 */
var minOperations = function (nums) {
    const size = nums.length;
    const uniqueNums = [...new Set(nums)];
    uniqueNums.sort((a, b) => a - b);

    let lp = 0,
        rp = 1,
        result = size - 1;
    while (rp < uniqueNums.length) {
        if (rp <= lp) {
            rp += 1;
            continue;
        }
        const delta = uniqueNums[rp] - uniqueNums[lp];
        if (delta < size) {
            result = Math.min(size - (rp - lp + 1), result);
            rp += 1;
        } else {
            lp += 1;
        }
    }

    return result;
};
