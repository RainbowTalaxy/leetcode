class CQueue {

    var stackIn = [Int]()
    var stackOut = [Int]()
    
    func appendTail(_ value: Int) {
        stackIn.append(value)
    }
    
    func deleteHead() -> Int {
        if stackOut.isEmpty {
            while !stackIn.isEmpty {
                stackOut.append(stackIn.removeLast())
            }
        }
        return stackOut.isEmpty ? -1 : stackOut.removeLast()
    }
}