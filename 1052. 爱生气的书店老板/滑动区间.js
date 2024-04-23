/**
 * @param {number[]} customers
 * @param {number[]} grumpy
 * @param {number} minutes
 * @return {number}
 */
var maxSatisfied = function (customers, grumpy, minutes) {
    const n = customers.length;
    let left = 0,
        right = minutes;
    const loss = customers.map((c, i) => c * grumpy[i]);
    const total = customers.reduce(
        (prev, s, i) => prev + s * (1 - grumpy[i]),
        0,
    );
    let delta = loss.slice(left, right).reduce((prev, s) => prev + s, 0);
    let maxn = delta;
    for (; right < n; right += 1) {
        delta -= loss[left];
        left += 1;
        delta += loss[right];
        maxn = Math.max(maxn, delta);
    }
    return total + maxn;
};
