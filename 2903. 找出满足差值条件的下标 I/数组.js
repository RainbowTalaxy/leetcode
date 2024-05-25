/**
 * @param {number[]} nums
 * @param {number} indexDifference
 * @param {number} valueDifference
 * @return {number[]}
 */
var findIndices = function (nums, indexDifference, valueDifference) {
    const n = nums.length;
    const lmins = [],
        lmaxs = [],
        rmins = [],
        rmaxs = [];
    let clmin, clmax, crmin, crmax;
    clmin = clmax = nums[0];
    crmin = crmax = nums[n - 1];
    for (let i = 0; i < n; i += 1) {
        clmin = Math.min(clmin, nums[i]);
        lmins.push(clmin);
        clmax = Math.max(clmax, nums[i]);
        lmaxs.push(clmax);
        crmin = Math.min(crmin, nums[n - 1 - i]);
        rmins.push(crmin);
        crmax = Math.max(crmax, nums[n - 1 - i]);
        rmaxs.push(crmax);
    }
    rmins.reverse();
    rmaxs.reverse();
    for (let i = 0; i < n - indexDifference; i += 1) {
        const lmin = lmins[i],
            rmax = rmaxs[i + indexDifference];
        if (rmax - lmin >= valueDifference) {
            const ai = nums.findIndex((i) => i === lmin);
            const aj = nums
                .slice()
                .reverse()
                .findIndex((i) => i === rmax);
            return [ai, n - 1 - aj];
        }
        const lmax = lmaxs[i],
            rmin = rmins[i + indexDifference];
        if (lmax - rmin >= valueDifference) {
            const ai = nums.findIndex((i) => i === lmax);
            const aj = nums
                .slice()
                .reverse()
                .findIndex((i) => i === rmin);
            return [ai, n - 1 - aj];
        }
    }
    return [-1, -1];
};
