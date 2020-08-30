#include<iostream>
#include<vector>
using namespace std;

vector<int>  kmp_table(string word) {
    // pos: current position in 'table'
    // cnd: next position of current substring in 'word'
    int pos = 1, cnd = 0, word_len = word.size();
    vector<int> table(word_len, -1);
    
    while (pos < word_len) {
        if (word[pos] == word[cnd]) {
            table[pos] = table[cnd];
        } else {
            table[pos] = cnd;
            cnd = table[cnd];
            while (cnd >= 0 && word[pos] != word[cnd]) {
                cnd = table[cnd];
            }
        }
        pos += 1;
        cnd += 1;
    }

    return table;
}

vector<int> kmp_search(string text, string word) {
    vector<int> positions, table = kmp_table(word);
    int text_len = text.size(), word_len = word.size();
    // j: current position in 'text'
    // k: current position in 'word'
    int j = 0, k = 0;
    
    while (j < text_len) {
        if (word[k] == text[j]) {
            j += 1;
            k += 1;
            if (k == word_len) {
                // match found, if only first match is needed, return 'j - k'
                positions.push_back(j - k);
                k = table[k];
            }
        } else {
            k = table[k];
            if (k < 0) {
                j += 1;
                k += 1;
            }
        }
    }

    return positions;
}

int main() {
    string text = "abcdabcdabcdefghi", word = "abcdef";
    vector<int> result = kmp_search(text, word);
    for (auto e: result) {
        cout << e << endl;
    }
    return 0;
}