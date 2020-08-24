// 36ms
class Solution {
public:
    bool repeatedSubstringPattern(string s) {
        int len = s.size();
        vector<bool> prime(len + 1, true);
        for (int i = 2; i <= len; i += 1) {
            if (prime[i] && len % i == 0) {
                for (int j = i; j <= len; j += i) {
                    prime[j] = false;
                }
                bool outerFlag = true;
                int slice = len / i;
                for (int det = 0; det < slice; det += 1) {
                    int standard = s[det];
                    bool flag = true;
                    for (int k = slice + det; k < len; k += slice) {
                        if (s[k] != standard) {
                            flag = false;
                            break;
                        }
                    }
                    if (!flag) {
                        outerFlag = false;
                        break;
                    }
                }
                if (outerFlag) {
                    return true;
                }
            }
        }
        return false;
    }
};