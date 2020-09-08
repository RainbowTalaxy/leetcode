// 128ms
var combine = function(n, k) {
    function combination(start, k) {
        let result = []
        if (k == 1) {
            for (let i = start; i <= n; i += 1) {
                result.push([i])
            }
        } else {
            for (let i = start; i <= n; i += 1) {
                if (n + 1 - i >= k) {
                    let pres = combination(i + 1, k - 1)
                    for (let pre in pres) {
                        pres[pre].unshift(i)
                        result.push(pres[pre])
                    }
                }
            }
        }
        return result
    }
    return combination(1, k)
};