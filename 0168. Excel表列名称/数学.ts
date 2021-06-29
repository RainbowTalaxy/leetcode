const dict = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

function convertToTitle(columnNumber: number): string {
    let result = ''
    while (columnNumber > 0) {
        result = dict[(columnNumber - 1) % 26] + result
        columnNumber = Math.floor(columnNumber / 26) - (columnNumber % 26 === 0 ? 1 : 0) 
    }
    return result
};