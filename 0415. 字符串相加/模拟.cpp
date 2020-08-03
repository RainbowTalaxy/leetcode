// 4ms
class Solution {
public:
    string addStrings(string num1, string num2) {
        int p_1 = num1.size() - 1, p_2 = num2.size() - 1;
        string result = "";
        int c = 0;
        while (p_1 >= 0 || p_2 >= 0) {
            if (p_1 >= 0) {
                c += num1[p_1] - '0';
                p_1--;
            }
            if (p_2 >= 0) {
                c += num2[p_2] - '0';
                p_2--;
            }
            result += '0' + c % 10;
            c /= 10;
        }
        if (c > 0) {
            result += '0' + c;
        }
        reverse(result.begin(), result.end());
        return result;
    }
};