// 20ms
class Solution {
public:
    string reverseWords(string s) {
        vector<int> spacePos;
        int len = s.size();
        for (int i = 0; i < len; i += 1) {
            if (s[i] == ' ') {
                spacePos.push_back(i + 1);
            }
        }
        spacePos.push_back(len + 1);
        auto start = s.begin();
        for (auto pos: spacePos) {
            reverse(start, s.begin() + pos - 1);
            start = s.begin() + pos;
        }
        return s;
    }
};