// 36ms
class Solution {
public:
    int countBinarySubstrings(string s) {
        int len = s.size(), result = 0;
        int pre = 0, count = 0;
        char current = '0';
        for (auto c: s) {
            if (c == current) {
                count += 1;
            } else {
                result += min(pre, count);
                pre = count;
                count = 1;
                current = c;
            }
        }
        result += min(pre, count);
        return result;
    }
};