var getKthFromEnd = function(head, k) {
    let table = []
    while (head) {
        table.push(head)
        head = head.next
    }
    return table[table.length - k]
};