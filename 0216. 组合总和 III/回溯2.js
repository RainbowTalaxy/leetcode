/**
 * @param {number} k
 * @param {number} n
 * @return {number[][]}
 */
var combinationSum3 = function (k, n) {
    const result = [];
    function iterate(picked, i, sum) {
        if (sum > n || picked.length > k) return;
        if (sum === n && picked.length === k)
            return result.push(picked.slice());
        if (i > 9) return;
        iterate(picked, i + 1, sum);
        picked.push(i);
        iterate(picked, i + 1, sum + i);
        picked.pop();
    }
    iterate([], 1, 0);
    return result;
};
