// 288ms
var profitableSchemes = function(n, minProfit, group, profit) {
    const len = group.length, floor = 1e9 + 7
    let table = new Array(len + 1).fill(0).map(_ => 
        new Array(n + 1).fill(0).map(_ => 
            new Array(minProfit + 1).fill(0)
        )
    )
    table[0][0][0] = 1
    for (let i = 1; i <= len; i += 1) {
        for (let p = 0; p <= n; p += 1) {
            for (let f = 0; f <= minProfit; f += 1) {
                if (p >= group[i - 1]) {
                    table[i][p][f] = (table[i - 1][p][f] + table[i - 1][p - group[i - 1]][Math.max(0, f - profit[i - 1])]) % floor
                } else {
                    table[i][p][f] = table[i - 1][p][f]
                }
            }
        }
    }

    let result = 0
    for (let p = 0; p <= n; p += 1) {
        result += table[len][p][minProfit]
        result %= floor
    }
    return result
};