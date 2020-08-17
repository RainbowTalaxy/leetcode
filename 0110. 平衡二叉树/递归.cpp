// 24ms
class Solution {
public:
    bool isBalanced(TreeNode* root) {
        return height(root) != -1;
    }

    int height(TreeNode* root) {
        if (root == nullptr) {
            return 0;
        } else {
            // 这里可以优化，左子树如果是 -1 就不必搜右子树了
            int leftHeight = height(root->left), rightHeight = height(root->right);
            int det = leftHeight - rightHeight;
            if (leftHeight == -1 || rightHeight == -1 || det > 1 || det < -1) {
                return -1;
            } else {
                return 1 + max(leftHeight, rightHeight);
            }
        }
    }
};