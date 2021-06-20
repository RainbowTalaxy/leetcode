function maxLength(arr: string[]): number {
  arr = arr.filter(s => {
      let set = new Set<string>()
      for (const c of s) {
          if (set.has(c)) {
              return false
          }
          set.add(c)
      }
      return true
  })
  
  let result = 0

  function check(i: number, set: string) {
      if (i === arr.length) {
          result = Math.max(result, set.length)
          return
      }
      check(i + 1, set)
      for (const c of arr[i]) {
          if (set.includes(c)) {
              return
          }
      }
      check(i + 1, set + arr[i])
  }

  check(0, '')
  return result
};