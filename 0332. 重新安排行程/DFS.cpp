// 84ms
class Solution {
public:
    static bool cmp(const vector<string>& s1, const vector<string>& s2) {
        return s1[1] < s2[1];
    }

    vector<string> result = {"JFK"};
    vector<bool> visit;

    vector<string> findItinerary(vector<vector<string>>& tickets) {
        visit = vector(tickets.size(), false);
        sort(tickets.begin(), tickets.end(), cmp);
        handleNext(tickets);
        return result;
    }

    bool handleNext(vector<vector<string>>& tickets) {
        int len = tickets.size();
        string pre = result.back();
        for (int i = 0; i < len; i += 1) {
            if (!visit[i] && tickets[i][0] == pre) {
                visit[i] = true;
                result.push_back(tickets[i][1]);
                if (handleNext(tickets)) {
                    return true;
                } else {
                    visit[i] = false;
                    result.pop_back();
                }
            }
        }
        return result.size() == len + 1 || false;
    }
};