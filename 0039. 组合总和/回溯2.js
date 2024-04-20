/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum = function (candidates, target) {
    const result = [];
    function iterate(picked, currentIdx, sum) {
        if (sum > target || currentIdx >= candidates.length) return;
        if (sum === target) return result.push(picked.slice());
        iterate(picked, currentIdx + 1, sum);
        const currentNum = candidates[currentIdx];
        picked.push(currentNum);
        iterate(picked, currentIdx, sum + currentNum);
        picked.pop();
    }
    iterate([], 0, 0);
    return result;
};
