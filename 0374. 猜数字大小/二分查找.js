var guessNumber = function(n) {
    let l = 1, r = n + 1
    while (l < r) {
        const m = Math.floor((l + r) / 2)
        result = guess(m)
        if (result == 0) {
            return m
        } else if (result === -1) {
            r = m
        } else {
            l = m + 1
        }
    }
    return l
};