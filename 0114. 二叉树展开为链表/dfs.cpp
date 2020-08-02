// 4ms
class Solution {
public:
    vector<int> sequence;

    void flatten(TreeNode* root) {
        dfs(root);
        TreeNode* pre = nullptr;
        for (auto e: sequence) {
            if (root == nullptr) {
                root = new TreeNode();
                pre->right = root;
            } else {
                root->left = nullptr;
            }
            root->val = e;
            pre = root;
            root = root->right;
        }
    }

    void dfs(TreeNode* root) {
        if (root != nullptr) {
            sequence.push_back(root->val);
            dfs(root->left);
            dfs(root->right);
        }
    }
};