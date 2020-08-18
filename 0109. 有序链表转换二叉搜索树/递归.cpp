// 44ms
class Solution {
public:
    TreeNode* sortedListToBST(ListNode* head) {
        if (head == nullptr) {
            return nullptr;
        } else {
            int len = 0;
            ListNode* t = head;
            while (t != nullptr) {
                len += 1;
                t = t->next;
            }

            if (len == 1) {
                return new TreeNode(head->val);
            } else {
                int stop = len / 2 - 1;
                int count = 0;
                ListNode* pre = head;
                while (count != stop) {
                    count += 1;
                    pre = pre->next;
                }
                ListNode* mid = pre->next;
                pre->next = nullptr;
                TreeNode* root = new TreeNode(mid->val);
                root->left = sortedListToBST(head);
                root->right = sortedListToBST(mid->next);
                return root;
            }
        }
    }
};