var solution = function(isBadVersion) {
    /**
     * @param {integer} n Total versions
     * @return {integer} The first bad version
     */
    return function(n) {
        let l = 1, r = n + 1
        while (l < r) {
            let m = Math.floor((l + r) / 2)
            if (isBadVersion(m)) {
                r = m
            } else {
                l = m + 1
            }
        }
        return r
    };
};

// 2021.6.13 大仙剪完头发回来就开空调了