#include<vector>
#include<string>
using namespace std;

vector<int> getNext(string pattern) {
    int len = pattern.size(), prefix_end = 0;
    vector<int> next(len, 0);

    for (int i = 1; i < len; i += 1) {
        while (prefix_end > 0 && pattern[prefix_end] != pattern[i]) {
            prefix_end = next[prefix_end - 1];
        }
        if (pattern[prefix_end] == pattern[i]) {
            prefix_end += 1;
        }
        next[i] = prefix_end;
    }

    return next;
}

vector<int> kmp_match(string target, string pattern) {
    int p_len = pattern.size(), match_end = 0;
    vector<int> next = getNext(pattern), result;

    for (int i = 0; i < target.size(); i += 1) {
        while (match_end > 0 && target[i] != pattern[match_end]) {
            match_end = next[match_end - 1];
        }
        if (target[i] == pattern[match_end]) {
            match_end += 1;
        }
        if (match_end == p_len) {
            result.push_back(i - p_len + 1);
        }
    }

    return result;
}

int kmp(string target, string pattern) {
    int p_len = pattern.size(), t_len = target.size();

    if (p_len == 0) {
        return 0;
    }

    int match_end = 0;
    vector<int> next(p_len, 0), result;

    for (int i = 1; i < p_len; i += 1) {
        while (match_end > 0 && pattern[i] != pattern[match_end]) {
            match_end = next[match_end - 1];
        }
        if (pattern[i] == pattern[match_end]) {
            match_end += 1;
        }
        next[i] = match_end;
    }

    match_end = 0;

    for (int i = 0; i < t_len; i += 1) {
        while (match_end > 0 && target[i] != pattern[match_end]) {
            match_end = next[match_end - 1];
        }
        if (target[i] == pattern[match_end]) {
            match_end += 1;
        }
        if (match_end == p_len) {
            return i - p_len + 1;
        }
    }

    return -1;
}