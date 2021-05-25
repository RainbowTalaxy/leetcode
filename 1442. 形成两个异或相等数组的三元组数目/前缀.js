// 148ms
var countTriplets = function(arr) {
    const len = arr.length
    let table = new Array(len + 1).fill(0)
    for (let i = 1; i <= len; i += 1) {
        table[i] = table[i-1] ^ arr[i-1]
    }
    console.log(table)
    let result = 0
    for (let i = 1; i < len; i += 1) {
        for (let j = i + 1; j <= len; j += 1) {
            for (let k = j; k <= len; k += 1) {
                if ((table[k] ^ table[j-1]) == (table[j-1] ^ table[i-1])) {
                    result += 1
                }
            }
        }
    }
    return result
};