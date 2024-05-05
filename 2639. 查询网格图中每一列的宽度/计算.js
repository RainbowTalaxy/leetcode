/**
 * @param {number[][]} grid
 * @return {number[]}
 */
var findColumnWidth = function (grid) {
    function getWidth(num) {
        return num.toString().length;
    }
    const m = grid.length,
        n = grid[0].length;
    const result = Array(n).fill(0);
    for (let i = 0; i < n; i += 1) {
        for (let j = 0; j < m; j += 1) {
            result[i] = Math.max(result[i], getWidth(grid[j][i]));
        }
    }
    return result;
};
