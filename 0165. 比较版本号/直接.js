var compareVersion = function(version1, version2) {
    let v1 = version1.split(".").map(n => Number(n))
    let v2 = version2.split(".").map(n => Number(n))
    if (v1.length < v2.length) {
        v1 = v1.concat(new Array(v2.length - v1.length).fill(0))
    } else if (v2.length < v1.length) {
        v2 = v2.concat(new Array(v1.length - v2.length).fill(0))
    }
    for (let i = 0; i < v1.length; i += 1) {
        if (v1[i] < v2[i]) {
            return -1
        } else if (v1[i] > v2[i]) {
            return 1
        }
    }
    return 0
};