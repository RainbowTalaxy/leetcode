const SIZE = 10

const steps = [
    [ 1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1],
    [-1, 0, 0, 0], [0,-1, 0, 0], [0, 0,-1, 0], [0, 0, 0,-1],
]

function makeTable(init: any): any {
    return new Array(SIZE).fill(0).map(_ => 
        new Array(SIZE).fill(0).map(_ => 
            new Array(SIZE).fill(0).map(_ => 
                new Array(SIZE).fill(init)
            )
        )
    )
}

function openLock(deadends: string[], target: string): number {
    let valid = makeTable(true) as any as boolean[][][][]
    let visit = makeTable(false) as any as boolean[][][][]
    let dest = target.split('').map(i => parseInt(i))
    for (const end of deadends) {
        let [x, y, z, t] = end.split('').map(i => parseInt(i))
        valid[x][y][z][t] = false
    }
    let result = Number.MAX_SAFE_INTEGER
    let q: [number[], number][] = []
    q.push([[0, 0, 0, 0], 0])
    while (q.length != 0) {
        const [p, n] = q.shift()
        if (p.toString() === dest.toString()) {
            result = Math.min(result, n)
            continue
        }
        let [x, y, z, t] = p
        if (valid[x][y][z][t]) {
            visit[x][y][z][t] === true
            for (const step of steps) {
                let next = p.map((n, i) => (n + step[i] + SIZE) % SIZE)
                let [x, y, z, t] = next
                if (!visit[x][y][z][t]) {
                    visit[x][y][z][t] = true
                    q.push([next, n + 1])
                }
            }
        }
    }
    return result === Number.MAX_SAFE_INTEGER ? -1 : result
};

// [x][y][z][t]