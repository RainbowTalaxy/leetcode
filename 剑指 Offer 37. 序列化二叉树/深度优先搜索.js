/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

/**
 * Encodes a tree to a single string.
 *
 * @param {TreeNode} root
 * @return {string}
 */

 var serialize = function(root) {
  let nums = []

  function inOrder(root) {
      if (root === null) {
          nums.push(null)
      } else {
          nums.push(root.val)
          inOrder(root.left)
          inOrder(root.right)
      }
  }

  inOrder(root)
  return nums.join(',')
};

/**
* Decodes your encoded data to tree.
*
* @param {string} data
* @return {TreeNode}
*/
var deserialize = function(data) {
  let nums = data.split(',').map(i => i === '' ? null : parseInt(i))
  let i = -1

  function build() {
      i += 1
      if (nums[i] === null) {
          return null
      } else {
          let node = new TreeNode(nums[i])
          node.left = build()
          node.right = build()
          return node
      }
  }

  return build()
};

/**
* Your functions will be called as such:
* deserialize(serialize(root));
*/