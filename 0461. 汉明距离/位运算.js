// 88ms
var hammingDistance = function(x, y) {
    let result = 0
    for (let i = 0; i < 31; i += 1) {
        result += (x >> i & 1) ^ (y >> i & 1)
    }
    return result
};