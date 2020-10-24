// 80ms
class Solution {
    func videoStitching(_ clips: [[Int]], _ T: Int) -> Int {
        var record = [Int](repeating: -1, count: T)
        for clip in clips {
            if clip[0] < T {
                record[clip[0]] = max(record[clip[0]], clip[1])
            }
        }
        var sorted = [[Int]]()
        for i in 0..<T {
            if record[i] != -1 {
                sorted.append([i, record[i]])
            }
        }
        var filtered = [[Int]](), maxn = 0
        for clip in sorted {
            if clip[0] > maxn {
                return -1
            } else if clip[1] > maxn {
                filtered.append(clip)
                maxn = clip[1]
            }
        }
        var table = [[Int]]()
        for clip in filtered {
            var time = Int.max
            for info in table {
                if info[1] >= clip[0] {
                    time = min(time, info[0])
                }
            }
            if clip[1] >= T {
                return (time == Int.max ? 0 : time) + 1
            } else {
                print(table)
                table.append([(time == Int.max ? 0 : time) + 1, clip[1]])
            }
        }
        return -1
    }
}