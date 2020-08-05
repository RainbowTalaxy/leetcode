// 12ms
class Solution {
public:
    int rob(TreeNode* root) {
        if (root == NULL) {
            return 0;
        // 负数代表搜索过，取负即原来的值
        } else if (root->val < 0) {
            return -root->val;
        } else {
            int direct = rob(root->left) + rob(root->right);
            int indirect = root->val;
            if (root->left != NULL) {
                indirect += rob(root->left->left) + rob(root->left->right);
            }
            if (root->right != NULL) {
                indirect += rob(root->right->left) + rob(root->right->right);
            }
            // 将搜索过的结果取负，用来标记为已搜索过
            root->val = -max(direct, indirect);
            return -root->val;
        }
    }
};