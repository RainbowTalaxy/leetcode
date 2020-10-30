// 3088ms
class RandomizedCollection {

    var list = [Int]()

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a value to the collection. Returns true if the collection did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        let result = !list.contains(val)
        list.append(val)
        return result
    }
    
    /** Removes a value from the collection. Returns true if the collection contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if let idx = list.firstIndex(of: val) {
            list.remove(at: idx)
            return true
        } else {
            return false
        }
    }
    
    /** Get a random element from the collection. */
    func getRandom() -> Int {
        list.randomElement() ?? list[0]
    }
}