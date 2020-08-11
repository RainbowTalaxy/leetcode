// 28ms
class Solution {
public:
    int row, col;
    vector<vector<bool>> mark;

    void solve(vector<vector<char>>& board) {
        row = board.size();
        if (row == 0) {
            return;
        }
        col = board[0].size();
        mark = vector(row, vector<bool>(col, false));
        for (int i = 0; i < col; i += 1) {
            if (board[0][i] == 'O') {
                dfs(0, i, board);
            }
            if (board[row - 1][i] == 'O') {
                dfs(row - 1, i, board);
            }
        }
        for (int i = 0; i < row; i += 1) {
            if (board[i][0] == 'O') {
                dfs(i, 0, board);
            }
            if (board[i][col - 1] == 'O') {
                dfs(i, col - 1, board);
            }
        }
        for (int i = 0; i < row; i += 1) {
            for (int j = 0; j < col; j += 1) {
                if (board[i][j] == 'O' && !mark[i][j]) {
                    board[i][j] = 'X';
                }
            }
        }
    }

    void dfs(int x, int y, vector<vector<char>>& board) {
        if (board[x][y] == 'O' && !mark[x][y]) {
            mark[x][y] = true;
            if (x - 1 >= 0) {
                dfs(x - 1, y, board);
            }
            if (x + 1 < row) {
                dfs(x + 1, y, board);
            }
            if (y - 1 >= 0) {
                dfs(x, y - 1, board);
            }
            if (y + 1 < col) {
                dfs(x, y + 1, board);
            }
        }
    }
};