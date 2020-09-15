// 156 ms
var solveSudoku = function (board) {
    var map = board.map(i => {
        return i.map(i => {
            return i == "." ? undefined : Number(i)
        })
    })

    function validValues(x, y) {
        var exist = new Array(10).fill(true)
        var row = Math.floor(x / 3), col = Math.floor(y / 3)
        var minX = row * 3, maxX = minX + 3, minY = col * 3, maxY = minY + 3
        for (let i = minX; i < maxX; i += 1) {
            for (let j = minY; j < maxY; j += 1) {
                if (map[i][j] != undefined) {
                    exist[map[i][j]] = false
                }
            }
        }
        for (let i = 0; i < 9; i += 1) {
            if (map[i][y] != undefined) {
                exist[map[i][y]] = false
            }
            if (map[x][i] != undefined) {
                exist[map[x][i]] = false
            }
        }
        var result = []
        exist.forEach((val, idx) => {
            if (val) {
                result.push(idx)
            }
        })
        return result.slice(1)
    }

    function next(x, y) {
        y += 1
        x += Math.floor(y / 9)
        y %= 9
        return [x, y]
    }

    function fillIn(x, y) {
        if (x >= 9 || y >= 9) {
            return true
        } else if (map[x][y] != undefined) {
            return fillIn(...next(x, y))
        } else {
            let valid = validValues(x, y), len = valid.length
            for (let i = 0; i < len; i += 1) {
                map[x][y] = valid[i]
                let result = fillIn(...next(x, y))
                if (result) {
                    return true
                }
            }
            map[x][y] = undefined
            return false
        }
    }

    fillIn(0, 0)

    for (let i = 0; i < 9; i += 1) {
        for (let j = 0; j < 9; j += 1) {
            board[i][j] = String(map[i][j])
        }
    }
};