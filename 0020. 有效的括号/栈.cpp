// 4ms
class Solution {
public:
    bool isValid(string s) {
        stack<char> store;
        for (auto c: s) {
            switch(c) {
                case '(': case '{': case '[':
                    store.push(c);
                    break;
                case ')': case '}': case ']':
                    if (store.empty() || c - store.top() > 3 || c - store.top() < 0) {
                        return false;
                    } else {
                        store.pop();
                        break;
                    }
            }
        }
        return store.empty();
    }
};