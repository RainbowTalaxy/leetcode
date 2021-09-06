var rand10 = function() {
  while (true) {
      let num = (rand7() - 1) * 7 + (rand7() - 1)
      if (num >= 1 && num <= 40) {
          return num % 10 + 1
      }
  }
};