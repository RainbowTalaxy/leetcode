/**
 * @param {number[][]} graph
 * @param {number[]} initial
 * @return {number}
 */
var minMalwareSpread = function (graph, initial) {
    const n = graph.length;
    const roots = Array(n)
        .fill(null)
        .map((_, i) => i);

    function findRoot(node) {
        if (roots[node] === node) return node;
        return (roots[node] = findRoot(roots[node]));
    }

    for (let i = 0; i < n; i += 1) {
        for (let j = i + 1; j < n; j += 1) {
            if (graph[i][j]) roots[findRoot(i)] = findRoot(j);
        }
    }

    const countMap = new Map();
    for (let i = 0; i < n; i += 1) {
        const nodeRoot = findRoot(i);
        if (countMap.has(nodeRoot)) {
            countMap.set(nodeRoot, countMap.get(nodeRoot) + 1);
        } else {
            countMap.set(nodeRoot, 1);
        }
    }

    const virusMap = new Map();
    initial.forEach((node) => {
        const nodeRoot = findRoot(node);
        if (virusMap.has(nodeRoot)) {
            virusMap.set(nodeRoot, virusMap.get(nodeRoot) + 1);
        } else {
            virusMap.set(nodeRoot, 1);
        }
    });

    console.log(roots, countMap, virusMap);

    let result = Infinity,
        maxn = 0;
    for (let i = 0; i < initial.length; i += 1) {
        let effect = 0;
        const nodeRoot = findRoot(initial[i]);
        if (virusMap.has(nodeRoot)) {
            const group = virusMap.get(nodeRoot);
            if (group === 1) effect = countMap.get(nodeRoot);
        }
        if (effect > maxn) {
            result = initial[i];
            maxn = effect;
        } else if (effect === maxn) {
            result = Math.min(initial[i], result);
        }
    }

    return result;
};
