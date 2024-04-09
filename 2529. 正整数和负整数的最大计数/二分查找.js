/**
 * @param {number[]} nums
 * @return {number}
 */
var maximumCount = function (nums) {
    function lowerBound(val) {
        let l = 0,
            r = nums.length;
        while (l < r) {
            const m = (l + r) >> 1;
            if (nums[m] >= val) {
                r = m;
            } else {
                l = m + 1;
            }
        }
        return l;
    }

    const i0 = lowerBound(0);
    const i1 = lowerBound(1);
    return Math.max(i0, nums.length - i1);
};
