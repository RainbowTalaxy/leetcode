// 208ms
class Solution {
    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
        var map: [Int: Employee] = [:]
        employees.forEach { e in 
            map[e.id] = e 
        }
        var result = 0
        
        func search(_ id: Int) {
            if let e = map[id] {
                result += e.importance
                e.subordinates.forEach { id in
                    search(id)
                }
            }
        }

        search(id)
        return result
    }
}