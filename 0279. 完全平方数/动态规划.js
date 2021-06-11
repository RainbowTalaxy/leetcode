// 248ms
var numSquares = function(n) {
    let table = new Array(n + 1).fill(Number.MAX_VALUE)
    table[0] = 0
    let squares = new Array(100).fill(0).map((_, i) => Math.pow(i + 1, 2))
    for (const s of squares) {
        for (let i = s; i <= n; i += 1) {
            table[i] = Math.min(table[i - s] + 1, table[i])
        }
    }
    return table[n]
};