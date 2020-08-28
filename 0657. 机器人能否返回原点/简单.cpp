// 12ms
class Solution {
public:
    bool judgeCircle(string moves) {
        int l = 0, r = 0, u = 0, d = 0;
        for (auto move: moves) {
            switch (move) {
                case 'L': l += 1; break;
                case 'R': r += 1; break;
                case 'U': u += 1; break;
                case 'D': d += 1; break;
            }
        }
        return l == r && u == d;
    }
};