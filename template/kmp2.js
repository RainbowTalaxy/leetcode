function generateNext(pattern) {
	const next = new Array(pattern.length).fill(0); // 初始化 next 数组，并填充为 0

	let i = 1; // pattern 中当前字符的下标
	let j = 0; // 最长前缀的下一个字符的下标（同时也是最长后缀的长度）

	while (i < pattern.length) {
		// 遍历整个 pattern
		if (pattern[i] === pattern[j]) {
			// 如果当前字符匹配成功
			j++;
			next[i] = j; // 将 next[i] 设为 j，并同时将 i 和 j 向后移动一位
			i++;
		} else {
			j = getNext(j, next); // 回退 j，获取新的 j 值
			if (j === -1) {
				// 如果 j 回退到了第一个字符，即没有任何相同前后缀
				next[i] = 0; // 将 next[i] 设为 0
				i++;
				j = 0;
			}
		}
	}

	return next; // 返回生成的 next 数组
}

// 获取新的 j 值
function getNext(j, next) {
	while (j > 0) {
		if (next[j - 1] === -1 || next[j - 1] === next[j] - 1) {
			return next[j - 1] + 1;
		} else {
			j = next[j - 1];
		}
	}
	return -1; // 如果 j 回退到了第一个字符，即没有任何相同前后缀，则返回 -1
}

const template = "ababcabaa";
console.log(generateNext(template).join(","));
