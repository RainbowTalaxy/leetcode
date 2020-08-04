// 力扣题解
class Solution {
public:
    vector<int> smallestRange(vector<vector<int>>& nums) {
        int rangeLeft = 0, rangeRight = INT_MAX;
        int size = nums.size();
        // 每个数组的当前指针，从 0 开始
        // vector(size, value) ，value 默认为 0
        vector<int> next(size, 0);
        
        auto cmp = [&](const int& u, const int& v) {
            return nums[u][next[u]] > nums[v][next[v]];
        };

        // decltype 返回传入参数的类型
        // 优先队列默认是大顶堆（大的在队头）
        priority_queue<int, vector<int>, decltype(cmp)> pq(cmp);
        int minValue = 0, maxValue = INT_MIN;
        for (int i = 0; i < size; ++i) {
            // emplace（c11） 和 push 的区别：
            // emplace 在队列中构造参数，push 先构造参数再放入队列中
            pq.emplace(i);
            maxValue = max(maxValue, nums[i][0]);
        }

        while (true) {
            // 最小值的下标
            int row = pq.top();
            // priority_queue::pop 没有返回值
            pq.pop();
            // 最小值
            minValue = nums[row][next[row]];
            // 题目要求：最小的区间长度
            if (maxValue - minValue < rangeRight - rangeLeft) {
                rangeLeft = minValue;
                rangeRight = maxValue;
            }
            // 如果某个数组走到头了，意味着所有数组检查终止
            if (next[row] == nums[row].size() - 1) {
                break;
            } else {
                ++next[row];
            }
            // 更新最大值
            maxValue = max(maxValue, nums[row][next[row]]);
            pq.emplace(row);
        }

        return {rangeLeft, rangeRight};
    }
};