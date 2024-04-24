/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @param {number} start
 * @return {number}
 */
var amountOfTime = function (root, start) {
    let q = [root];
    let node = null;
    while (q.length > 0) {
        const p = q.shift();
        if (p.val === start) node = p;
        if (p.left) {
            p.left.parent = p;
            q.push(p.left);
        }
        if (p.right) {
            p.right.parent = p;
            q.push(p.right);
        }
    }

    const levels = Array(100001).fill(0);
    levels[node.val] = 1;

    q = [node];
    let maxn = 1;

    function check(node, next) {
        if (!next || levels[next.val]) return;
        levels[next.val] = levels[node.val] + 1;
        maxn = Math.max(maxn, levels[next.val]);
        q.push(next);
    }

    while (q.length > 0) {
        const p = q.shift();
        check(p, p.left);
        check(p, p.right);
        check(p, p.parent);
    }

    return maxn - 1;
};
