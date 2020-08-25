// 556ms
class Solution {
public:
    unsigned int count = 0;
    
    vector<vector<int>> findSubsequences(vector<int>& nums) {
        vector<vector<int>> result;
        if (nums.size() > count) {
            count = nums.size();
        }
        if (nums.size() == 1) {
            result.push_back({nums[0]});
        } else if (nums.size() > 1) {
            int num = nums.back();
            nums.pop_back();
            vector<vector<int>> pres = findSubsequences(nums);
            set<vector<int>> added;
            for (auto pre: pres) {
                added.insert(pre);
                if (pre.back() <= num) {
                    pre.push_back(num);
                    added.insert(pre);
                }
            }
            for (auto a: added) {
                result.push_back(a);
            }
            result.push_back({num});
            nums.push_back(num);
        }
        if (nums.size() == count) {
            vector<vector<int>> filtered;
            for (auto r: result) {
                if (r.size() > 1) {
                    filtered.push_back(r);
                }
            }
            result = filtered;
        }
        return result;
    }
};