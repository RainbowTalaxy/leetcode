function isNumber(s: string): boolean {
  const DIGITS = '0123456789'
  const SIGNS = '+-'

  function isDigits(s: string): boolean {
      if (s.length == 0) {
          return false
      }
      for (const c of s) {
          if (!DIGITS.includes(c)) {
              return false
          }
      }
      return true
  }

  function isInteger(s: string): boolean {
      if (s.length > 1 && SIGNS.includes(s[0])) {
          return isDigits(s.slice(1))
      } else {
          return isDigits(s)
      }
  }

  function isDecimal(s: string): boolean {
      const parts = s.split('.')
      if (parts.length === 1) {
          return isInteger(parts[0])
      } else if (parts.length === 2) {
          if (parts[0].length === 0) {
              return isDigits(parts[1])
          } else if (parts[1].length === 0) {
              return isInteger(parts[0])
          } else {
              return isInteger(parts[0] + '0') && isDigits(parts[1])
          }
      }
      return false
  }

  const parts = s.split(/[eE]/)
  if (parts.length === 1) {
      return isDecimal(parts[0])
  } else if (parts.length === 2) {
      return isDecimal(parts[0]) && isInteger(parts[1])
  }
  return false
};