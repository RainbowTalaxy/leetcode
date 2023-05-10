function generateNext(pattern) {
	const next = new Array(pattern.length).fill(0); // 初始化 next 数组，并填充为 0

	let i = 1; // pattern 中当前字符的下标
	let j = 0; // 最长前缀的下一个字符的下标（同时也是最长后缀的长度）

	while (i < pattern.length) {
		// 遍历整个 pattern
		if (pattern[i] === pattern[j]) {
			// 如果当前字符匹配成功
			next[i] = j + 1; // 将 next[i] 设为 j+1，并同时将 i 和 j 向后移动一位
			i++;
			j++;
		} else if (j > 0) {
			// 如果前面匹配过程中已经有匹配成功的前缀
			j = next[j - 1]; // 将 j 跳回到上一个匹配成功的前缀的下一个字符
		} else {
			// 如果前面没有匹配成功的前缀，即 j=0
			next[i] = 0; // 将 next[i] 设为 0，i 后移一位
			i++;
		}
	}

	return next; // 返回生成的 next 数组
}

const template = "ababcabaa";
console.log(generateNext(template).join(","));

// ababcabaa

// i = 1, j = 0
// a[b]a b c a b a a
//   |
//  [a]b a b c a b a a
// 0,0

// i = 2, j = 0
// a b[a]b c a b a a
//     |
//    [a]b a b c a b a a
// 0,0,1

// i = 3, j = 1
// a b[a b]c a b a a
//       |
//    [a b]a b c a b a a
// 0,0,1,2

// i = 4, j = 2
// a b[a b c]a b a a
//         |
//    [a b a]b c a b a a

// i = 4, j = 0
// a b a b[c]a b a a
//         |
//        [a]b a b c a b a a
// 0,0,1,2,0

// i = 5, j = 0
// a b a b c[a]b a a
//           |
//          [a]b a b c a b a a
// 0,0,1,2,0,1

// i = 6, j = 1
// a b a b c[a b]a a
//             |
//          [a b]a b c a b a a
// 0,0,1,2,0,1,2

// i = 7, j = 2
// a b a b c[a b a]a
//               |
//          [a b a]b c a b a a
// 0,0,1,2,0,1,2,3

// i = 8, j = 3
// a b a b c[a b a a]
//                 |
//          [a b a b]c a b a a

// i = 8, j = 1
// a b a b c a b[a a]
//                 |
//          	[a b]a b c a b a a

// i = 8, j = 0
// a b a b c a b a[a]
//                 |
//          	  [a]b a b c a b a a
// 0,0,1,2,0,1,2,3,1
