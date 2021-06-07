// 1000ms
var findTargetSumWays = function(nums, target) {
    const len = nums.length
    let table = new Array(len).fill(0).map(i =>
        // -20000 ~ 20000
        new Array(40001).fill(-1)
    )

    function memory(i, sum) {
        if (i === -1) {
            return sum === 0 ? 1 : 0
        } else if (i >= 0) {
            if (table[i][sum + 20000] === -1) {
                table[i][sum + 20000] = search(i, sum)
            }
            return table[i][sum + 20000]
        } else {
            return 0
        }
    }

    function search(i, sum) {
        return memory(i - 1, sum + nums[i]) + memory(i - 1, sum - nums[i])
    }

    return memory(len - 1, target)
};

// dp[i][s] = dp[i-1][s+n[i]] + dp[i-1][s-n[i]]