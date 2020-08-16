// 28ms
class Solution {
public:
    vector<vector<int>> floodFill(vector<vector<int>>& image, int sr, int sc, int newColor) {
        vector<vector<int>> copy = image;
        int row = image.size(), col = image[0].size();
        int origin = image[sr][sc];
        if (origin != newColor) {
            queue<pair<int, int>> q;
            q.push(make_pair(sr, sc));
            while (!q.empty()) {
                auto p = q.front();
                q.pop();
                if (p.first >= 0 && p.first < row && p.second >= 0 && p.second < col) {
                    if (copy[p.first][p.second] == origin) {
                        copy[p.first][p.second] = newColor;
                        q.push(make_pair(p.first - 1, p.second));
                        q.push(make_pair(p.first + 1, p.second));
                        q.push(make_pair(p.first, p.second - 1));
                        q.push(make_pair(p.first, p.second + 1));
                    }
                }
            }
        }
        return copy;
    }
};