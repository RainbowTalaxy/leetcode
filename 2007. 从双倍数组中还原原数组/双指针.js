/**
 * @param {number[]} changed
 * @return {number[]}
 */
var findOriginalArray = function (changed) {
    const size = changed.length;
    const sorted = changed.slice();
    sorted.sort((a, b) => a - b);
    const visited = Array(size).fill(false);
    let i = 0,
        j = 1;
    const result = [];
    for (; i < size; i += 1) {
        if (visited[i]) continue;
        j = Math.max(i + 1, j);
        const doubled = sorted[i] * 2;
        while (sorted[j] < doubled && j < size) j += 1;
        if (sorted[j] > doubled) return [];
        if (j === size) break;
        visited[i] = visited[j] = true;
        j += 1;
        result.push(sorted[i]);
    }
    return result.length * 2 === size ? result : [];
};
