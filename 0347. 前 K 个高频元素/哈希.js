// 96ms
var topKFrequent = function(nums, k) {
    var map = {}
    for (let i in nums) {
        if (map[nums[i]] == undefined) {
            map[nums[i]] = 1
        } else {
            map[nums[i]] += 1
        }
    }
    var result = []
    for (let i in map) {
        result.push([i, map[i]])
    }
    return result.sort(function(a, b) {
        return b[1] - a[1]
    }).slice(0, k).map(i => i[0])
};