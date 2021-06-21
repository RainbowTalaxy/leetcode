function readBinaryWatch(turnedOn: number): string[] {
  let table = new Array(10).fill(0)
  let result: string[] = []
  function trace(i: number, rest: number) {
      if (i === 10) {
          if (rest !== 0) {
              return
          }
          let hour = 0, min = 0
          for (let i = 0; i < 4; i += 1) {
              hour = hour * 2 + table[i]
          }
          for (let i = 4; i < 10; i += 1) {
              min = min * 2 + table[i]
          }
          if (hour < 12 && min < 60) {
              result.push(`${hour}:${min > 9 ? '' : '0'}${min}`)
          }
          return
      } else {
          trace(i + 1, rest)
          if (rest > 0) {
              table[i] = 1
              trace(i + 1, rest - 1)
              table[i] = 0
          }
      }
  }
  trace(0, turnedOn)
  return result
};