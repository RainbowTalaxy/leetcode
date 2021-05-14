// 172ms
var romanToInt = function(s) {
    let result = 0

    s = s.replaceAll('CM', 'K')
        .replaceAll('CD', 'E')
        .replaceAll('XC', 'H')
        .replaceAll('XL', 'P')
        .replaceAll('IX', 'Q')
        .replaceAll('IV', 'Z')

    let map = {
        M: 1000,
        K: 900,
        D: 500,
        E: 400,
        C: 100,
        H: 90,
        L: 50,
        P: 40,
        X: 10,
        Q: 9,
        V: 5,
        Z: 4,
        I: 1,
    }

    for (let c of s) {
        result += map[c]
    }

    return result
};