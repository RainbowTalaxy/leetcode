// 16ms
class Solution {
public:
    string shortestPalindrome(string s) {
        string pre = init(s);
        vector<int> table = manacher(pre);
        int len = table.size();
        for (int i = len - 1; i > 0; i -= 1) {
            if (table[i] == i) {
                string middle = "";
                if (pre[i] != '#') {
                    middle.push_back(pre[i]);
                }
                string right = "";
                for (int j = i + 1; j < len; j += 1) {
                    if (pre[j] != '#') {
                        right.push_back(pre[j]);
                    }
                }
                string left = right;
                reverse(left.begin(), left.end());
                return left + middle + right;
            }
        }
        return "";
    }

    string init(string s) {
        string result = "!#";
        for (auto c: s) {
            result.push_back(c);
            result.push_back('#');
        }
        return result;
    }

    vector<int> manacher(string s) {
        int len = s.size(), pos = 0, right = 0;
        vector<int> result(len, 1);
        for (int i = 1; i < len; i += 1) {
            if (i < right) {
                result[i] = min(result[pos * 2 - i], right - i);
            }
            while (s[i - result[i]] == s[i + result[i]]) {
                result[i] += 1;
            }
            if (right < i + result[i]) {
                pos = i;
                right = i + result[i];
            }
        }
        return result;
    }
};