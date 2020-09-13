// 128ms
var exist = function(board, word) {
    var table = board.map(i => [])
    const pos = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    const len = word.length, row = board.length, col = board[0].length

    function search(x, y, index) {
        if (board[x][y] == word[index]) {
            index += 1
            if (index == len) {
                return true
            } else {
                let result = false
                table[x][y] = 1
                for (let i = 0; i < 4; i += 1) {
                    let px = x + pos[i][0], py = y + pos[i][1]
                    if (px >= 0 && px < row && py >= 0 && py < col && table[px][py] != 1) {
                        result = result || search(px, py, index)
                    }
                }
                table[x][y] = undefined
                return result
            }
        } else {
            return false
        }
    }
    
    for (let i = 0; i < row; i += 1) {
        for (let j = 0; j < col; j += 1) {
            if (search(i, j, 0)) {
                return true
            }
        }
    }
    return false
};