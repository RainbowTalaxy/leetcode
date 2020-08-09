// 4ms
class Solution {
public:
    vector<string> stack;
    vector<string> result;

    vector<string> restoreIpAddresses(string s) {
        search(s, 4);
        return result;
    }

    void search(string s, int n) {
        if (n == 1) {
            if (!s.empty() && check(s)) {
                result.push_back(stack[0] + "." + stack[1] + "." + stack[2] + "." + s);
            }
        } else {
            for (int i = 1; i < 4 && i < s.size(); i += 1) {
                string sub = s.substr(0, i);
                if (check(sub)) {
                    stack.push_back(sub);
                    search(s.substr(i), n - 1);
                    stack.pop_back();
                }
            }
        }
    }

    bool check(string s) {
        return (s[0] == '0' && s.size() > 1) ? false : (s.size() < 4 && stoi(s) < 256);
    }
};