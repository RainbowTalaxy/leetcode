// 0ms
class Solution {
public:
    int strStr(string haystack, string needle) {
        int len = needle.size(), match_end = 0;

        if (len == 0) return 0;

        vector<int> next(len, 0), result;

        for (int i = 1; i < len; i += 1) {
            while (match_end > 0 && needle[i] != needle[match_end]) {
                match_end = next[match_end - 1];
            }
            if (needle[match_end] == needle[i]) {
                match_end += 1;
            }
            next[i] = match_end;
        }

        match_end = 0;

        for (int i = 0; i < haystack.size(); i += 1) {
            while (match_end > 0 && haystack[i] != needle[match_end]) {
                match_end = next[match_end - 1];
            }
            if (haystack[i] == needle[match_end]) {
                match_end += 1;
            }
            if (match_end == len) {
                return i - len + 1;
            }
        }

        return -1;
    }
};