// 12ms
class Solution {
public:
    map<int, Node*> map;

    Node* cloneGraph(Node* node) {
        if (node == nullptr) return nullptr;
        if (map.count(node->val) == 0) {
            Node* copy = new Node(node->val);
            map[node->val] = copy;
            for (auto neighbor: node->neighbors) {
                copy->neighbors.push_back(cloneGraph(neighbor));
            }
        }
        return map[node->val];
    }
};