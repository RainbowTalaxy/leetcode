/**
 * @param {number} n
 * @param {number[][]} edges
 * @return {number}
 */
var findChampion = function (n, edges) {
    const endPointCounts = Array(n).fill(0);
    edges.forEach((e) => {
        endPointCounts[e[1]] += 1;
    });
    const result = [];
    endPointCounts.forEach((count, idx) => {
        if (count === 0) result.push(idx);
    });
    return result.length === 1 ? result[0] : -1;
};
