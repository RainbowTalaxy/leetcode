function snakesAndLadders(board: number[][]): number {
  let row = board.length, col = board[0].length, n = row * col

  let table = [0]
  let r = row - 1, c = 0, f = 1
  while (table.length <= n) {
      table.push(board[r][c])
      let type = (row - r) % 2
      if ((type === 0 && c === 0) || (type === 1 && c === col - 1)) {
          f *= -1; r -= 1
      } else {
          c += f
      }
  }

  let steps = new Array(n + 1).fill(Number.MAX_SAFE_INTEGER)
  let q: [number, number][] = [[1, 0]]
  while (q.length !== 0) {
      let [x, step] = q.pop()
      if (table[x] !== -1) {
          x = table[x]
      }
      if (steps[x] > step) {
          steps[x] = step
          for (let i = 1; i <= 6 && x + i <= n; i += 1) {
              q.push([x + i, step + 1])
          }
      }
  }
  
  return steps[n] === Number.MAX_SAFE_INTEGER ? -1 : steps[n]
};