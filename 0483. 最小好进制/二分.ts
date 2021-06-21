function smallestGoodBase(n: string): string {

  function buildNumber(len: number, base: bigint): bigint {
      let result = 0n
      for (let i = 0; i < len; i += 1) {
          result = result * base + 1n
      }
      return result
  }

  const num = BigInt(n)

  for (let i = 60; i >= 1; i -= 1) {
      let l = 2n, r = num
      while (l < r) {
          let m = (l + r) / 2n
          let target = buildNumber(i, m)
          if (target === num) {
              return String(m)
          } else if (target < num) {
              l = m + 1n
          } else {
              r = m
          }
      }
  }

};