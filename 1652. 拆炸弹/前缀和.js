/**
 * @param {number[]} code
 * @param {number} k
 * @return {number[]}
 */
var decrypt = function (code, k) {
    const table = code.concat(code).concat(code);
    for (let i = 1; i < table.length; i += 1) {
        table[i] = table[i] + table[i - 1];
    }
    const n = code.length;
    return Array(n)
        .fill(0)
        .map((_, i) => {
            if (k >= 0) return table[n + i + k] - table[n + i];
            return table[n + i - 1] - table[n + i - 1 + k];
        });
};
