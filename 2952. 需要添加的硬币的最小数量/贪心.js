/**
 * @param {number[]} coins
 * @param {number} target
 * @return {number}
 */
var minimumAddedCoins = function (coins, target) {
	coins.sort((a, b) => a - b);
	let count = 0,
		expect = 1,
		upper = 0;
	for (let coin of coins) {
		while (coin > expect) {
			count += 1;
			upper += expect;
			if (upper >= target) return count;
			expect = upper + 1;
		}
		upper += coin;
		if (upper >= target) return count;
		expect = upper + 1;
	}
	while (target >= expect) {
		count += 1;
		upper += expect;
		if (upper >= target) return count;
		expect = upper + 1;
	}
	return count;
};
