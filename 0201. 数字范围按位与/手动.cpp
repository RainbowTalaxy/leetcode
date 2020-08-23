// 11ms
class Solution {
public:
    int rangeBitwiseAnd(int m, int n) {
        int current = 1;
        vector<int> bits;
        for (int i = 0; i < 31; i += 1) {
            bits.push_back(current);
            current <<= 1;
        }
        vector<bool> flags(31, false);
        int init = n;
        for (int i = 0; i < 31; i += 1) {
            flags[i] = ((init & 1) == 1);
            init >>= 1;
        }
        for (int i = 0; i < 31; i += 1) {
            if (flags[i]) {
                if (bits[i] - 1 >= m) {
                    flags[i] = false;
                    continue;
                }
                int minn = 0;
                for (int j = i; j < 31; j += 1) {
                    if (flags[j]) {
                        minn += bits[j];
                    }
                }
                if (minn - 1 >= m) {
                    flags[i] = false;
                }
            }
        }
        int result = 0;
        for (int i = 0; i < 31; i += 1) {
            if (flags[i]) {
                result += bits[i];
            }
        }
        return result;
    }
};