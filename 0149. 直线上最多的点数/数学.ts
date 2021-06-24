function maxPoints(points: number[][]): number {
  let map = new Map<string, Set<number>>()
  const len = points.length
  if (len === 1) {
      return 1
  }
  for (let i = 0; i < len; i += 1) {
      for (let j = i + 1; j < len; j += 1) {
          let yAB = getAB(points[i], points[j])
          if (map.has(yAB)) {
              let set = map.get(yAB)
              set.add(i)
              set.add(j)
          } else {
              let set = new Set<number>()
              set.add(i)
              set.add(j)
              map.set(yAB, set)
          }
      }
  }
  return Math.max(...Array.from(map.values()).map(s => s.size))
};

function getFraction(a: number, b: number): number[] {
  if (b < 0) {
      a = -a
      b = -b
  }
  if (a === 0) {
      b = 1
  }
  let r = 0, ta = a, tb = b
  while (tb > 0) {
      r = Math.abs(ta % tb)
      ta = tb
      tb = r
  }
  a = a / ta
  b = b / ta
  return [a, b]
}

function getAB(p1: number[], p2: number[]): string {
  if (p1[0] === p2[0]) {
      return `x=${p1[0]}`
  } else if (p1[1] === p2[1]) {
      return `y=${p1[1]}`
  } else {
      let A = getFraction(p1[1] - p2[1], p1[0] - p2[0])
      let B = getFraction(p1[1] * A[1] - A[0] * p1[0], A[1])
      return `y=${A[0]}/${A[1]}x+${B[0]}/${B[1]}`
  }
}

// y = Ax + B, [A, B]
// B = y - Ax