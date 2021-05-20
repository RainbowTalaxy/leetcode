// 100ms
var topKFrequent = function(words, k) {
    var map = new Map()
    for (let word of words) {
        let cnt = map.get(word)
        if (cnt !== undefined) {
            map.set(word, cnt + 1)
        } else {
            map.set(word, 1)
        }
    }
    let pairs = new Array(...map.entries()).sort((a, b) => {
        if (a[1] == b[1]) {
            if (a[0] == b[0]) {
                return 0
            } else if (a[0] < b[0]) {
                return -1
            } else {
                return 1
            }
        } else {
            return b[1] - a[1]
        }
    })
    .map(i => i[0])
    .slice(0, k)
    
    return pairs
};