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
 * @return {number}
 */
var maxAncestorDiff = function (root) {
    let result = 0;
    root.min = root.max = root.val;
    const queue = [root];
    const push = (parent, child) => {
        if (child === null) return;
        queue.push(child);
        child.parent = parent;
        child.min = Math.min(child.val, parent.min);
        child.max = Math.max(child.val, parent.max);
    };
    while (queue.length > 0) {
        const p = queue.shift();
        const lowerGap = Math.abs(p.val - p.min);
        const upperGap = Math.abs(p.val - p.max);
        result = Math.max(lowerGap, upperGap, result);
        push(p, p.left);
        push(p, p.right);
    }
    return result;
};
