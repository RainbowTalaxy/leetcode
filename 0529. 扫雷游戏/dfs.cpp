// 168ms
class Solution {
public:
    vector<vector<int>> dets = {
        {-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}
    };

    vector<vector<char>> updateBoard(vector<vector<char>>& board, vector<int>& click) {
        int x = click[0], y = click[1];
        switch (board[x][y]) {
            case 'M':
                board[x][y] = 'X';
                break;
            case 'E':
                int i = 0;
                for (auto det: dets) {
                    if (check(board, x + det[0], y + det[1]) && board[x + det[0]][y + det[1]] == 'M') {
                        i += 1;
                    }
                }
                if (i == 0) {
                    board[x][y] = 'B';
                    for (auto det: dets) {
                        if (check(board, x + det[0], y + det[1]) && board[x + det[0]][y + det[1]] == 'E') {
                            vector<int> c = {x + det[0], y + det[1]};
                            updateBoard(board, c);
                        }
                    }
                } else {
                    board[x][y] = '0' + i;
                }
        }
        return board;
    }

    bool check(vector<vector<char>>& board, int x, int y) {
        return x >= 0 && x < board.size() && y >= 0 && y < board[0].size();
    }
};