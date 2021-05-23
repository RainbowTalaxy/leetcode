// 8128ms
var maximizeXor = function (nums, queries) {
    const ans = []
    nums.sort((a, b) => a - b)

    for (let query of queries) {
        let max = -1
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] > query[1]) {
                break
            } else {
                max = Math.max(max, query[0] ^ nums[i])
            }
        }
        ans.push(max)
    }
    return ans
};

// 字典树（爆内存）
//  var maximizeXor = function(nums, queries) {
//     class Trie {
//         nodes = [null, null]
//         minn = Number.MAX_VALUE

//         insert(num) {
//             let current = this
//             current.minn = Math.min(num, current.minn)
//             for (let i = 31; i >= 0; i -= 1) {
//                 let p = num >> i & 1
//                 if (current.nodes[p] == null) {
//                     current.nodes[p] = new Trie()
//                 }
//                 current = current.nodes[p]
//                 current.minn = Math.min(num, current.minn)
//             }
//         }

//         getValue(x, m) {
//             let current = this, result = 0
//             for (let i = 31; i >= 0; i -= 1) {
//                 if (current.minn > m) {
//                     return -1
//                 }
//                 let wb = x >> i & 1
//                 if (current.nodes[1-wb] != null && current.nodes[1-wb].minn <= m) {
//                     wb = 1 - wb
//                 }
//                 result = (result << 1) + wb
//                 current = current.nodes[wb]
//             }
//             return result ^ x
//         }
//     }

//     let trie = new Trie()
//     for (let num of nums) {
//         trie.insert(num)
//     }
//     let result = []
//     for (let query of queries) {
//         result.push(trie.getValue(...query))
//     }
//     return result
// };