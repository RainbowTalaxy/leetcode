var search = function(nums, target) {
  const binary_search = (left, right) => {
      console.log(left, right)
      if (left > right) {
          return null
      } else {
          let mid = Math.floor((left + right) / 2)
          if (target > nums[mid]) {
              return binary_search(mid + 1, right)
          } else if (target < nums[mid]) {
              return binary_search(left, mid - 1)
          } else {
              return mid
          }
      }
  }
  return binary_search(0, nums.length - 1) ?? -1
};