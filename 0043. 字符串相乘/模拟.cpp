// 56ms
class Solution {
public:
    string multiply(string num1, string num2) {
        string result = "0";
        reverse(num1.begin(), num1.end());
        reverse(num2.begin(), num2.end());
        if (num1 != "0") {
            for (int i = 0; i < num2.size(); i += 1) {
                if (num2[i] != '0') {
                    string temp(i, '0');
                    int c = 0;
                    for (auto num: num1) {
                        c += (num - '0') * (num2[i] - '0');
                        temp += '0' + c % 10;
                        c /= 10;
                    }
                    if (c > 0) {
                        temp += '0' + c;
                    }
                    reverse(temp.begin(), temp.end());
                    result = addStrings(result, temp);
                }
            }
        }
        return result;
    }

    string addStrings(string num1, string& num2) {
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