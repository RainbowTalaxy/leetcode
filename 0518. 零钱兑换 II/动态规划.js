// 104ms
var change = function(amount, coins) {
    let table = new Array(amount + 1).fill(0)
    table[0] = 1
    for (const coin of coins) {
        for (let i = coin; i <= amount; i += 1) {
            table[i] += table[i - coin]
        }
    }
    return table[amount]
};