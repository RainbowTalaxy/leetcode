// 20ms
class Solution {
    func numRabbits(_ answers: [Int]) -> Int {
        var nums: [Int:Int] = [:]
        for answer in answers {
            if let num = nums[answer] {
                nums[answer] = num + 1
            } else {
                nums[answer] = 1
            }
        }

        var result = 0
        for (answer, num) in nums {
            let groupSum = answer + 1
            let group = num / groupSum
            let extra = (num % groupSum) > 0 ? 1 : 0
            result += groupSum * (group + extra)
        }

        return result
    }
}