// 0ms
class Solution {
public:
    vector<string> map = {
        "", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"
    };

    vector<string> letterCombinations(string digits) {
        int len = digits.size();
        vector<string> result;
        if (len == 0) {
            return result;
        } else if (len == 1) {
            string s = "";
            for (auto c: map[digits[0] - '0']) {
                result.push_back(s + c);
            }
        } else {
            char c = digits.back();
            digits.pop_back();
            vector<string> pres = letterCombinations(digits);
            for (auto pre: pres) {
                for (auto c: map[c - '0']) {
                    result.push_back(pre + c);
                }
            }
        }
        return result;
    }
};