/**
 * @param {number[]} nums
 * @return {number}
 */
var minimumSum = function (nums) {
	const leftMins = Array(nums.length).fill(0);
	const rightMins = Array(nums.length).fill(0);
	let leftMin = 100,
		rightMin = 100;
	for (let i = 1; i < nums.length - 1; i += 1) {
		leftMin = Math.min(leftMin, nums[i - 1]);
		rightMin = Math.min(rightMin, nums[nums.length - i]);
		leftMins[i] = leftMin;
		rightMins[nums.length - 1 - i] = rightMin;
	}
	let result = 1000;
	for (let i = 1; i < nums.length - 1; i += 1) {
		if (nums[i] <= leftMins[i] || nums[i] <= rightMins[i]) continue;
		const sum = leftMins[i] + nums[i] + rightMins[i];
		result = Math.min(result, sum);
	}
	return result === 1000 ? -1 : result;
};
