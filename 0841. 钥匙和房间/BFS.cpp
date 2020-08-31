// 16ms
class Solution {
public:
    bool canVisitAllRooms(vector<vector<int>>& rooms) {
        int len = rooms.size();
        vector<bool> visit(len, false);
        queue<int> standby;
        standby.push(0);
        while (!standby.empty()) {
            int door = standby.front();
            standby.pop();
            visit[door] = true;
            for (auto room: rooms[door]) {
                if (!visit[room]) {
                    standby.push(room);
                }
            }
        }
        for (int i = 0; i < len; i += 1) {
            if (!visit[i]) {
                return false;
            }
        }
        return true;
    }
};