// 16ms
class Solution {
public:
    int countSubstrings(string s) {
        string ex = "#";
        int len = s.size();
        for (int i = 0; i < len; i += 1) {
            ex += s[i];
            ex += '#';
        }
        len = ex.size();
        int count = 0;
        for (int i = 0; i < len; i += 1) {
            int det = min(i, len - 1 - i), cnt = 0;
            for (int j = 0; j <= det; j += 1) {
                if (ex[i - j] == ex[i + j]) {
                    cnt += 1;
                } else {
                    break;
                }
            }
            count += cnt / 2;
        }
        return count;
    }
};