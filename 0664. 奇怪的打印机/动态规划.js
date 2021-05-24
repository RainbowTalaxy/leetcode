// 244ms
var strangePrinter = function(s) {
    const len = s.length
    let table = new Array(s.length).fill(0).map(_ => new Array(s.length).fill(-1))

    function memory(l, r) {
        if (table[l][r] == -1) {
            table[l][r] = search(l, r)
        }
        return table[l][r]
    }

    function search(l, r) {
        if (l == r) {
            return 1
        }
        if (s[l] == s[r]) {
            return memory(l, r - 1)
        } else {
            let minn = Number.MAX_VALUE
            for (let m = l; m + 1 <= r; m += 1) {
                minn = Math.min(minn, memory(l, m) + memory(m + 1, r))
            }
            return minn
        }
    }

    return memory(0, len - 1)
};