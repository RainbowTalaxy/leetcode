// 官方题解
class Solution {
public:
    // 目标值：24
    static constexpr int TARGET = 24;
    // 精度范围在 10^(-6)以内
    static constexpr double EPSILON = 1e-6;
    static constexpr int ADD = 0, MULTIPLY = 1, SUBTRACT = 2, DIVIDE = 3;

    bool judgePoint24(vector<int> &nums) {
        // 先将四个数转为浮点数
        vector<double> l;
        for (const int &num : nums) {
            l.emplace_back(static_cast<double>(num));
        }
        return solve(l);
    }

    bool solve(vector<double> &l) {
        if (l.size() == 0) {
            return false;
        }
        if (l.size() == 1) {
            // 在精度范围内，判断是否等于目标值 24
            return fabs(l[0] - TARGET) < EPSILON;
        }
        int size = l.size();
        // 用 i 和 j 从带组合数组中抽出两个数
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                if (i != j) {
                    vector<double> list2 = vector<double>();
                    // 将未选中的数放入新数组中
                    for (int k = 0; k < size; k++) {
                        if (k != i && k != j) {
                            list2.emplace_back(l[k]);
                        }
                    }
                    // 枚举加减乘除
                    for (int k = 0; k < 4; k++) {
                        // 只有减和除操作需要明确 i 和 j 的顺序
                        // 加和乘只要执行其中一种顺序即可，小优化
                        if (k < 2 && i > j) {
                            continue;
                        }
                        if (k == ADD) {
                            list2.emplace_back(l[i] + l[j]);
                        } else if (k == MULTIPLY) {
                            list2.emplace_back(l[i] * l[j]);
                        } else if (k == SUBTRACT) {
                            list2.emplace_back(l[i] - l[j]);
                        } else if (k == DIVIDE) {
                            if (fabs(l[j]) < EPSILON) {
                                continue;
                            }
                            list2.emplace_back(l[i] / l[j]);
                        }
                        if (solve(list2)) {
                            return true;
                        }
                        list2.pop_back();
                    }
                }
            }
        }
        return false;
    }
};
