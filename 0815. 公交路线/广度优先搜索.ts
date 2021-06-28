function numBusesToDestination(routes: number[][], source: number, target: number): number {
  if (source === target) {
      return 0
  }

  let lineNum = routes.length
  let trans: Set<number>[] = new Array(lineNum).fill(0).map(i => new Set())
  let sites = new Map<number, number[]>()
  for (let l = 0; l < lineNum; l += 1) {
      for (const stop of routes[l]) {
          if (sites.has(stop)) {
              let lines = sites.get(stop)
              for (const line of lines) {
                  trans[line].add(l)
                  trans[l].add(line)
              }
              lines.push(l)
          } else {
              sites.set(stop, [l])
          }
      }
  }

  let counts = new Array(lineNum).fill(Number.MAX_SAFE_INTEGER)
  if (sites.has(source) && sites.has(target)) {
      let q = sites.get(source).map(l => [l, 1])
      let targets = sites.get(target)
      while (q.length !== 0) {
          let [line, step] = q.pop()
          if (step < counts[line]) {
              counts[line] = step
              step += 1
              for (const l of trans[line].keys()) {
                  q.push([l, step])
              }
          }
      }
      let result = Math.min(...targets.map(l => counts[l]))
      return result === Number.MAX_SAFE_INTEGER ? -1 : result
  } else {
      return -1
  }
};