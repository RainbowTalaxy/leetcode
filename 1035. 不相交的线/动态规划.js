// 156ms
var maxUncrossedLines = function(nums1, nums2) {
    let row = nums1.length, col = nums2.length
    var table = new Array(row).fill(0).map(_ => new Array(col).fill(-1))

    function memory(i, j) {
        if (i < 0 || j < 0) {
            return 0
        } else if (table[i][j] === -1) {
            table[i][j] = search(i, j)
        }
        return table[i][j]
    }

    function search(i, j) {
        let result = 0
        if (nums1[i] == nums2[j]) {
            result = Math.max(result, memory(i-1, j-1) + 1)
        }
        return Math.max(result, memory(i, j-1), memory(i-1, j))
    }

    return memory(row-1, col-1)
};