// 336ms
var findMaximumXOR = function(nums) {
    class Trie {
        zero = null
        one = null

        append(num) {
            let current = this
            for (let i = 31; i >= 0; i -= 1) {
                let p = num >> i & 1
                if (p == 0) {
                    if (current.zero == null) {
                        current.zero = new Trie()
                    }
                    current = current.zero
                } else {
                    if (current.one == null) {
                        current.one = new Trie()
                    }
                    current = current.one
                }
            }
        }

        getXORMaxn(num) {
            let current = this
            let result = 0
            for (let i = 31; i >= 0; i -= 1) {
                let p = num >> i & 1
                if (current.zero == null && current.one == null) {
                    return 0
                }
                if (p == 0) {
                    if (current.one == null) {
                        result = result * 2
                        current = current.zero
                    } else {
                        result = result * 2 + 1
                        current = current.one
                    }
                } else {
                    if (current.zero == null) {
                        result = result * 2 + 1
                        current = current.one
                    } else {
                        result = result * 2
                        current = current.zero
                    }
                }
            }
            return result
        }
    }

    let result = 0
    let trie = new Trie()
    for (let num of nums) {
        trie.append(num)
        let xormaxn = trie.getXORMaxn(num)
        result = Math.max(result, num ^ xormaxn)
    }
    
    return result
};