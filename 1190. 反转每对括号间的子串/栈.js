// 84ms
function reverse(s) {
    return s.split('').reverse().join('')
}

var reverseParentheses = function(s) {
    let stack = [], buf = ''
    for (let i = 0; i < s.length; i += 1) {
        if (s[i] == '(') {
            stack.push(buf)
            buf = ''
        } else if (s[i] == ')' && stack.length > 0) {
            buf = stack.pop() + reverse(buf)
        } else {
            buf += s[i]
        }
    }
    return stack.join('(') + buf
};