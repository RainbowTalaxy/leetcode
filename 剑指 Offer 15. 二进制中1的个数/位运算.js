var hammingWeight = function(n) {
  let count = 0
  while (n > 0) {
      count += n & 1
      n = Math.floor(n / 2)
  }
  return count
};