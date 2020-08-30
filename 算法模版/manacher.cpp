#include<iostream>
#include<vector>
using namespace std;

string init(string s) {
    string result = "!#";
    for (auto c: s) {
        result.push_back(c);
        result.push_back('#');
    }
    return result;
}

vector<int> manacher(string s) {
    s = init(s);
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

int main() {
    string s = "aabcdefg";
    auto result = manacher(s);
    for (auto e: result) {
        cout << e << " ";
    }
    return 0;
}