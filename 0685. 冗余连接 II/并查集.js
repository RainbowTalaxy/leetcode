// 228ms
var findRedundantDirectedConnection = function (edges) {
    var len = edges.length
    var group = []
    function find(x) {
        return group[x] == x ? x : find(group[x])
    }
    function merge(x, y) {
        let fx = find(x), fy = find(y)
        group[fy] = fx
    }
    for (let i = len - 1; i >= 0; i -= 1) {
        group = new Array(len + 1).fill(0).map((v, i) => i)
        let root = new Array(len + 1).fill(0)
        for (let j = 0; j < len; j += 1) {
            let [u, v] = edges[j]
            if (j != i) {
                merge(u, v)
                root[v] += 1
            }
        }
        let rootZero = false, flag = true
        for (let j = 1; j <= len; j += 1) {
            if (root[j] == 0) {
                if (rootZero == false) {
                    rootZero = true
                } else {
                    flag = false
                    break;
                }
            }
        }
        if (flag) {
            let num = new Set()
            for (let j = 1; j <= len; j += 1) {
                num.add(find(j))
            }
            if (num.size <= 1) {
                return edges[i]
            }
        }
    }
    return [0, 0]
};