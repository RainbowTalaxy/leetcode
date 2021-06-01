// 984ms
var canEat = function(candiesCount, queries) {
    let len = candiesCount.length
    let table = new Array(len + 1).fill(0)
    let accu = 0
    for (let i = 0; i < len; i += 1) {
        accu += candiesCount[i]
        table[i+1] = accu
    }
    
    let result = new Array(queries.length).fill(false)
    queries.forEach((query, i) => {
        minNum = table[query[0]] + 1
        maxNum = table[query[0] + 1]
        if (query[1] + 1 <= maxNum && (query[1] + 1) * query[2] >= minNum) {
            result[i] = true
        }
    })

    return result
};