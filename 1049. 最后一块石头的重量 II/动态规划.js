// 116ms
var lastStoneWeightII = function(stones) {
    const len = stones.length
    const sum = stones.reduce((a, b) => a + b, 0), halfSum = Math.floor(sum / 2)
    let table = new Array(len + 1).fill(0).map(i =>
        new Array(halfSum + 1).fill(false)
    )
    table[0][0] = true
    for (let i = 1; i <= len; i += 1) {
        for (let j = 0; j <= halfSum; j += 1) {
            if (j < stones[i - 1]) {
                table[i][j] = table[i - 1][j]
            } else {
                table[i][j] = table[i - 1][j] || table[i - 1][j - stones[i - 1]]
            }
        }
    }
    for (let j = halfSum; j >= 0; j -= 1) {
        if (table[len][j]) {
            return sum - 2 * j
        }
    }
};