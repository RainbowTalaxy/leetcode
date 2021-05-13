// 172ms
var intToRoman = function(num) {
    let result = ''
    
    function check(divider, sign) {
        let cnt = Math.floor(num / divider)
        for (let i = 0; i < cnt; i += 1) {
            result += sign
        }
        num %= divider
    }

    check(1000, 'M')
    check(900, 'CM')
    check(500, 'D')
    check(400, 'CD')
    check(100, 'C')
    check(90, 'XC')
    check(50, 'L')
    check(40, 'XL')
    check(10, 'X')
    check(9, 'IX')
    check(5, 'V')
    check(4, 'IV')
    check(1, 'I')

    return result
};