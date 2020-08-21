// 16ms
class Solution {
public:
    int minDepth(TreeNode* root) {
        if (root == NULL) {
            return 0;
        } else if (root->left == NULL && root->right == NULL) {
            return 1;
        } else {
            int result = INT_MAX;
            if (root->left != NULL) {
                result = min(minDepth(root->left) + 1, result);
            }
            if (root->right != NULL) {
                result = min(minDepth(root->right) + 1, result);
            }
            return result;
        }
    }
};