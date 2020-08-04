// 40ms
class Solution {
public:
    bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {
        vector<vector<int>> edges(numCourses, vector<int>());
        vector<int> degrees(numCourses, 0);
        for (auto pre: prerequisites) {
            edges[pre[1]].push_back(pre[0]);
            degrees[pre[0]] += 1;
        }

        queue<int> q;
        for (int i = 0; i < numCourses; i += 1) {
            if (degrees[i] == 0) {
                q.push(i);
            }
        }

        int count = 0;
        while (!q.empty()) {
            int p = q.front();
            q.pop();
            count += 1;
            for (auto end: edges[p]) {
                degrees[end] -= 1;
                if (degrees[end] == 0) {
                    q.push(end);
                }
            }
        }

        return count == numCourses;
    }
};