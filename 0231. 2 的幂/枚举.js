// 104ms
var isPowerOfTwo = function(n) {
    let accu = 1
    for (let i = 0; i < 31; i += 1) {
        if (n === accu) {
            return true
        }
        accu = accu << 1
    }
    return false
};