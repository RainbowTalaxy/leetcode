function permutation(s: string): string[] {
  const len = s.length
  let visit = new Array(len).fill(false)
  let set = new Set<string>()
  let current = new Array<string>()
  function trace(rest: number) {
      if (rest === 0) {
          set.add(current.join(''))
      } else {
          for (let i = 0; i < len; i += 1) {
              if (!visit[i]) {
                  current.push(s[i])
                  visit[i] = true
                  trace(rest - 1)
                  visit[i] = false
                  current.pop()
              }
          }
      }
  }
  trace(len)
  return Array.from(set)
};