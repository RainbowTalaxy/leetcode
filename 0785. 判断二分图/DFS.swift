// 228ms
class Solution {
    enum Color {
        case red, green, white
    }
    
    func isBipartite(_ graph: [[Int]]) -> Bool {
        var colors = [Color](repeating: .white, count: graph.count)

        func dfs(_ master: Int) -> Bool {
            var color: Color = colors[master] == .red ? .green : .red
            var flag = true
            for neighbor in graph[master] {
                if colors[neighbor] == .white {
                    colors[neighbor] = color
                    flag = flag && dfs(neighbor)
                } else {
                    flag = flag && colors[neighbor] == color
                }
            }
            return flag
        }

        for i in 0 ..< graph.count {
            if colors[i] == .white {
                colors[i] = .red
                if !dfs(i) { return false }
            }
        }

        return true
    }
}