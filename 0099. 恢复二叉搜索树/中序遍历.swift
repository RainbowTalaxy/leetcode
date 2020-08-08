// 40ms
class Solution {
public:
    vector<TreeNode*> order;

    void recoverTree(TreeNode* root) {
        insertOrder(root);
        TreeNode *n1, *n2;
        for (int i = 0; i < order.size() - 1; i += 1) {
            if (order[i]->val > order[i + 1]->val) {
                n1 = order[i];
                break;
            }
        }
        for (int i = order.size() - 1; i > 0; i -= 1) {
            if (order[i]->val < order[i - 1]->val) {
                n2 = order[i];
                break;
            }
        }
        swap(n1->val, n2->val);
    }

    void insertOrder(TreeNode* node) {
        if (node != nullptr) {
            insertOrder(node->left);
            order.push_back(node);
            insertOrder(node->right);
        }
    }
};