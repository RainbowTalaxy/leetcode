// 444ms
class Solution {
    func sumOfDistancesInTree(_ N: Int, _ edges: [[Int]]) -> [Int] {
        var answer = [Int](repeating: 0, count: N)
        var sonNum = [Int](repeating: 0, count: N)
        var table = [Int](repeating: 0, count: N)
        var gragh = [[Int]](repeating: [], count: N)

        for edge in edges {
            gragh[edge[0]].append(edge[1])
            gragh[edge[1]].append(edge[0])
        }

        func countSons(_ u: Int, _ f: Int) {
            sonNum[u] = 1
            table[u] = 0
            for v in gragh[u] {
                if v == f {
                    continue
                }
                countSons(v, u)
                table[u] += table[v] + sonNum[v]
                sonNum[u] += sonNum[v]
            }
        }

        func transfer(_ u: Int, _ f: Int) {
            answer[u] = table[u]
            for v in gragh[u] {
                if v == f {
                    continue
                }
                var preU = table[u], preV = table[v]
                var sumU = sonNum[u], sumV = sonNum[v]
                table[u] -= table[v] + sonNum[v]
                sonNum[u] -= sonNum[v]
                table[v] += table[u] + sonNum[u]
                sonNum[v] += sonNum[u]
                transfer(v, u)
                table[u] = preU
                table[v] = preV
                sonNum[u] = sumU
                sonNum[v] = sumV
            }
        }

        countSons(0, -1)
        transfer(0, -1)
        return answer
    }
}