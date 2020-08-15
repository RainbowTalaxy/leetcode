// 官方题解
class Solution {
public:
    int dp[100][100][100];

    int removeBoxes(vector<int>& boxes) {
        memset(dp, 0, sizeof dp);
        return calculatePoints(boxes, 0, boxes.size() - 1, 0);
    }

    int calculatePoints(vector<int>& boxes, int l, int r, int k) {
        // 判断边界
        if (l > r) return 0;
        // 判断是否搜索过
        if (dp[l][r][k] != 0) return dp[l][r][k];
        // 压缩 r （同时要增加 k）
        while (r > l && boxes[r] == boxes[r - 1]) {
            r--;
            k++;
        }
        // 第一种情况：直接拿出后缀
        // 例：[3, 6, 4, 5, 6] + 3个6
        // 后缀的积分为 4 * 4 = 16
        dp[l][r][k] = calculatePoints(boxes, l, r - 1, 0) + (k + 1) * (k + 1);
        // 第二种情况：清除内部使得后缀变长
        // 例：[3, 6, 4, 5, 6] + 3个6
        // 可以清除 [4, 5] ，成为 [3, 6] + 4个6
        for (int i = l; i < r; i++) {
            if (boxes[i] == boxes[r]) {
                dp[l][r][k] = max(dp[l][r][k], calculatePoints(boxes, l, i, k + 1) + calculatePoints(boxes, i + 1, r - 1, 0));
            }
        }
        return dp[l][r][k];
    }
};