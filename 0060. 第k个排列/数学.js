// 76ms
var getPermutation = function(n, k) {
    var counts = [0, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]
    var current = []
    for (let i = 0; i < n; i += 1) {
        current[i] = i + 1
    }
    var result = []
    while (current.length != 0) {
        let i = Math.floor((k - 1) / counts[current.length - 1])
        k %= counts[current.length - 1]
        result.push(current.splice(i, 1)[0])
    }
    return result.join("")
};