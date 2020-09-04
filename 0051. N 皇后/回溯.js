// 来源：https://leetcode-cn.com/problems/n-queens/solution/shou-hua-tu-jie-cong-jing-dian-de-nhuang-hou-wen-t/
var solveNQueens = function(n) {
    const board = new Array(n)
    for (let i = 0; i < n; i++) {
        board[i] = new Array(n).fill('.')
    }
  
    const cols = new Set(), diag1 = new Set(), diag2 = new Set(), res = []
  
    const helper = (row) => {
        if (row == n) {
            const stringsBoard = board.slice()
            for (let i = 0; i < n; i++) {
                stringsBoard[i] = stringsBoard[i].join('')
            }
            res.push(stringsBoard)
            return
        }
        for (let col = 0; col < n; col++) {
            if (!cols.has(col) && !diag1.has(row + col) && !diag2.has(row - col)) { 
                board[row][col] = 'Q'
                cols.add(col)
                diag1.add(row + col)
                diag2.add(row - col)
                helper(row + 1)
                board[row][col] = '.'
                cols.delete(col)
                diag1.delete(row + col)
                diag2.delete(row - col)
            }
        }
    }

    helper(0)
    return res
}