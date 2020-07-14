// 48ms
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var triangle = triangle
        for i in (0 ..< (triangle.count - 1)).reversed() {
            for j in 0 ..< triangle[i].count {
                triangle[i][j] += min(triangle[i + 1][j], triangle[i + 1][j + 1])
            }
        }
        return triangle[0][0]
    }
}