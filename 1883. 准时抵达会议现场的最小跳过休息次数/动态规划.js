/**
 * @param {number[]} dist
 * @param {number} speed
 * @param {number} hoursBefore
 * @return {number}
 */
var minSkips = function (dist, speed, hoursBefore) {
    function ceil(value) {
        const mod = value % speed;
        return value + (mod === 0 ? 0 : speed - mod);
    }
    const optimizedDist = dist.map((d) => {
        hoursBefore -= Math.floor(d / speed);
        return d % speed;
    });
    const n = optimizedDist.length;
    const table = [[optimizedDist[0]]];
    for (let i = 1; i < n; i += 1) {
        const initial = ceil(table[i - 1][0]) + optimizedDist[i];
        table.push([initial]);
        for (let j = 1; j <= i; j += 1) {
            let count = table[i - 1][j - 1] + optimizedDist[i];
            if (j < i)
                count = Math.min(
                    count,
                    ceil(table[i - 1][j]) + optimizedDist[i],
                );
            table[i].push(count);
        }
    }
    const total = speed * hoursBefore;
    for (let j = 0; j < n; j += 1) {
        if (table[n - 1][j] <= total) return j;
    }
    return -1;
};

// [time, mile]
//  0 < dist[i] < speed

// dist = [7,3,5,5] speed = 2
// dist = [1,1,1,1] speed = 2

// dp[i][j], (j <= i) - 到达 i 时，跳过 j 次能达到的最短时间
// dp[i+1][j] = min(
//      ceil(dp[i][j]) + dist[i+1], 不跳过
//      ceil(dp[i][j-1] + dist[i+1]), 跳过
// )
// dp[0][0] = dist[0]
// dp[i][0] = ceil(dist[i-1]) + dist[i]
// dp[1][1] = ceil(dp[0][0])
// i - 0...n, j - 0...i
// min_j when dp[n-1][j] <= hoursBefore
