var largestNumber = function(cost, target) {
    let table = new Array(target + 1).fill(Number.MIN_SAFE_INTEGER)
    table[0] = 0
    for (let i = 0; i < 9; i += 1) {
        for (let j = cost[i]; j <= target; j += 1) {
            table[j] = Math.max(table[j], table[j - cost[i]] + 1)
        }
    }

    if (table[target] < 0) {
        return '0'
    }

    let result = '', rest = target
    for (let i = 8; i >= 0; i -= 1) {
        while (rest >= cost[i] && table[rest] == table[rest - cost[i]] + 1) {
            console.log(i, cost[i], rest)
            result = `${result}${i + 1}`
            rest -= cost[i]
        }
    }

    return result
};