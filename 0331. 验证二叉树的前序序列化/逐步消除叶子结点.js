/**
 * @param {string} preorder
 * @return {boolean}
 */
var isValidSerialization = function (preorder) {
	const nodes = preorder.split(",");
	while (nodes.length > 1) {
		const store = [];
		for (let i = 0; i < nodes.length - 2; i += 1) {
			if (nodes[i] !== "#" && nodes[i + 1] === "#" && nodes[i + 2] === "#") {
				store.push(i);
			}
		}
		if (store.length === 0) return false;
		store.reverse().forEach((index) => {
			nodes.splice(index, 3, "#");
		});
	}
	return nodes[0] === "#";
};
