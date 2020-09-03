// 104ms
var isNumber = function(s) {
    s = s.trim()
    var n = Number(s)
    return s != "" && (n == 0 || Boolean(n))
};