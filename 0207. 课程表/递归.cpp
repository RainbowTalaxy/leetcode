// 48ms
class Solution {
public:
    vector<bool> isSearched, isDone, visited;
    vector<vector<int>> pres;

    bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {
        isSearched = vector<bool>(numCourses, true);
        isDone = vector<bool>(numCourses, true);
        visited = vector<bool>(numCourses, false);
        pres = vector<vector<int>>(numCourses, vector<int>());

        for (auto pre: prerequisites) {
            isSearched[pre[0]] = isDone[pre[0]] = false;
            pres[pre[0]].push_back(pre[1]);
        }

        for (int i = 0; i < numCourses; i += 1) {
            if (!memory(i)) {
                return false;
            }
        }
        return true;
    }

    bool memory(int n) {
        if (!isSearched[n]) {
            isDone[n] = search(n);
            isSearched[n] = true;
        }
        return isDone[n];
    }

    bool search(int n) {
        bool result = true;
        visited[n] = true;
        for (auto pre: pres[n]) {
            if (visited[pre]) {
                return false;
            }
            result = result && memory(pre);
        }
        visited[n] = false;
        return result;
    }
};