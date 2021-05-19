// 976ms
var kthLargestValue = function(matrix, k) {
    let row = matrix.length, col = matrix[0].length
    let table = matrix.slice()
    for (let i = 0; i < row; i += 1) {
        let rowXOR = 0
        for (let j = 0; j < col; j += 1) {
            rowXOR = rowXOR ^ matrix[i][j]
            table[i][j] = rowXOR ^ (i > 0 ? table[i-1][j] : 0)
        }
    }
    return table.flat().sort((a, b) => b - a)[k-1]
};