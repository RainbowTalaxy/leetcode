// 168ms
// 官方题解
class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var map = [Int:Int]()

        func getID(_ x: Int) -> Int {
            return x >= 0 ? (x / (t + 1)) : ((x + 1) / (t + 1) - 1)
        }
        
        for (index,num) in nums.enumerated() {
            let id = getID(num)
            if map.keys.contains(id) {
                return true
            }
            if let val = map[id-1] , abs(num - val) <= t {
                return true
            }
            if let val = map[id+1] , abs(num - val) <= t {
                return true
            }
            map.updateValue(num, forKey: id)
            if index >= k {
                map.removeValue(forKey: getID(nums[index-k]))
            }
        }
        return false
    }
}