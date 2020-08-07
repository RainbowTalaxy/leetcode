#include<iostream>
#include<string>
using namespace std;

int main() {
    while (cin >> tmp) {
        // 将偶数回文（"abba"）变为奇数回文（"#a#b#b#a#"）
        string str = "#", tmp;
        for (int i = 0; i < tmp.size(); ++i) {
            str = str + tmp[i] + "#";
        }
        // 最长回文长度
        int maxlength = 1, tmplength;
        //str[0]左边没有字符，必定只是长度为1的回文，所以直接从str[1]开始寻找
        for (int i = 1; i < str.size(); ++i) {
            //判断从当前位置到字符串的最后的长度是不是比目前已求出的最长回文子串长度小
            //如果是的，就没有比较的意义了，直接退出循环
            if (i + maxlength >= str.size()) {
                break;
            }
            //如果按照已求出的最大回文长度来算，不能满足一下条件，说明在i这个位置，最长的回文长度也就是maxlength-1,所以不考虑，跳过
            if (str[i - maxlength] != str[i+maxlength]) {
                continue;
            } else {
                //代码能进行到这，说明i这个位置为回文中心，是有突破当前已求出的最长回文长度的可能的，下面进行求解
                tmplength = 1;
                //注意判断不要数组越界
                while (i + tmplength < str.size() && str[i-tmplength] == str[i+tmplength]) {
                    tmplength += 1;
                }
                //退出循环的时候，是发生了不等于的情况，所以需要在tmplength基础上-1
                tmplength--;
            }
            maxlength = max(maxlength, tmplength);
        }
        cout << maxlength << endl;
    }
    return 0;
}