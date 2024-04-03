/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} original
 * @param {TreeNode} cloned
 * @param {TreeNode} target
 * @return {TreeNode}
 */

var getTargetCopy = function (original, cloned, target) {
    const q1 = [original],
        q2 = [cloned];
    while (q1.length > 0) {
        const p1 = q1.shift(),
            p2 = q2.shift();
        if (p1 === target) return p2;
        if (p1.left !== null) {
            q1.push(p1.left);
            q2.push(p2.left);
        }
        if (p1.right !== null) {
            q1.push(p1.right);
            q2.push(p2.right);
        }
    }
    return null;
};
