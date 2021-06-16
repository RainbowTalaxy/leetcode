function stoneGame(piles: number[]): boolean {
    const len = piles.length
    let table = new Array(len).fill(0).map(_ => new Array(len).fill([0, 0]))
    for (let i = 0; i < len; i += 1) {
        table[i][i] = [piles[i], 0]
    }
    for (let s = 1; s < len; s += 1) {
        for (let i = 0; i + s < len; i += 1) {
            let l = i, r = i + s
            const m1 = piles[l] + table[l+1][r][1]
            const o1 = table[l+1][r][0]
            const m2 = piles[r] + table[l][r-1][1]
            const o2 = table[l][r-1][0]
            const det = (m1 - o1) - (m2 - o2)
            table[l][r] = det > 0 ? [m1, o1] : [m2, o2]
        }
    }
    return table[0][len-1][0] > table[0][len-1][1]
};