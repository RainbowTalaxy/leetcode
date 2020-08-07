// 力扣题解
class Solution {
public:
    struct node {
        int ch[26];
        // 是否是个单词的尽头
        int flag;
        node() {
            // -1 意思为不是单词的尽头
            flag = -1;
            memset(ch, 0, sizeof(ch));
        }
    };

    vector<node> tree;

    // id 为单词在所有单词中的下标，便于 findWord 返回目标位置
    // 引用传值会更效率一点
    void insert(string& s, int id) {
        int len = s.length(), add = 0;
        // 遍历 s 下标
        for (int i = 0; i < len; i++) {
            int x = s[i] - 'a';
            // 如果 ch[x] 还没对应一个 node
            if (!tree[add].ch[x]) {
                tree.emplace_back();
                // 下一结点
                tree[add].ch[x] = tree.size() - 1;
            }
            add = tree[add].ch[x];
        }
        // 普通的字典树貌似不需要 id 值
        tree[add].flag = id;
    }

    int findWord(string& s, int left, int right) {
        int add = 0;
        // 对应本题，应当反向查询单词，即查询回文
        for (int i = right; i >= left; i--) {
            int x = s[i] - 'a';
            // 如果无法向下遍历字符，即无该单词
            if (!tree[add].ch[x]) {
                return -1;
            }
            add = tree[add].ch[x];
        }
        return tree[add].flag;
    }

    // 回文判断（全段背诵）
    bool isPalindrome(string& s, int left, int right) {
        int len = right - left + 1;
        for (int i = 0; i < len / 2; i++) {
            if (s[left + i] != s[right - i]) {
                return false;
            }
        }
        return true;
    }

    vector<vector<int>> palindromePairs(vector<string>& words) {
        // 头节点插入
        tree.emplace_back(node());
        int n = words.size();
        // 将每个单词插入字典树中
        for (int i = 0; i < n; i++) {
            insert(words[i], i);
        }
        // 存放结果的容器
        vector<vector<int>> ret;
        // 对每个单词遍历
        for (int i = 0; i < n; i++) {
            int m = words[i].size();
            for (int j = 0; j <= m; j++) {
                // 判断当前单词中右部分是否存在回文
                // 即 s = s1 + s2 -> [0, m - 1] = [0, j - 1] + [j, m - 1]
                // s2 需要是回文，s1 能在字典树中找到
                if (isPalindrome(words[i], j, m - 1)) {
                    int left_id = findWord(words[i], 0, j - 1);
                    // 如果找到了 且 不为自身
                    if (left_id != -1 && left_id != i) {
                        ret.push_back({i, left_id});
                    }
                }
                // 与上一个 if 相反，判断左回文
                // s1 需要是回文，s2 能在字典树中找到
                if (j && isPalindrome(words[i], 0, j - 1)) {
                    int right_id = findWord(words[i], j, m - 1);
                    if (right_id != -1 && right_id != i) {
                        ret.push_back({right_id, i});
                    }
                }
            }
        }
        return ret;
    }
};