// 524ms
var findMaxForm = function(strs, m, n) {
    const len = strs.length, items = strs.map(s => {
        let zero = 0, one = 0
        for (let c of s) {
            c === '0' ? zero += 1 : one += 1
        }
        return [zero, one]
    })
    let table = new Array(len).fill(0).map(_ => 
        new Array(m + 1).fill(0).map(_ => 
            new Array(n + 1).fill(-1)
        )
    )
    
    function memory(i, zero, one) {
        if (i < 0 || zero < 0 || one < 0) {
            return 0
        }
        if (table[i][zero][one] === -1) {
            table[i][zero][one] = search(i, zero, one)
        }
        return table[i][zero][one]
    }

    function search(i, zero, one) {
        let result = memory(i - 1, zero, one)
        if (zero >= items[i][0] && one >= items[i][1]) {
            result = Math.max(result, memory(i - 1, zero - items[i][0], one - items[i][1]) + 1)
        }
        return result
    }

    return memory(len - 1, m, n)
};