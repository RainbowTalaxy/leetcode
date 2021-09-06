var fib = function(n) {
  if (n <= 1) {
      return n
  } else {
      let a = 1, b = 1
      for (let i = 2; i <= n; i += 1) {
          let t = (a + b) % 1000000007
          a = b
          b = t
      }
      return a
  }
};