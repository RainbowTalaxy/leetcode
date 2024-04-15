function hash(key) {
    return key % 1000;
}

var MyHashMap = function () {
    this.tables = Array(1000)
        .fill(null)
        .map((_) => []);
};

/**
 * @param {number} key
 * @param {number} value
 * @return {void}
 */
MyHashMap.prototype.put = function (key, value) {
    const table = this.tables[hash(key)];
    const pair = table.find((pair) => pair[0] === key);
    if (pair) {
        pair[1] = value;
    } else {
        table.push([key, value]);
    }
};

/**
 * @param {number} key
 * @return {number}
 */
MyHashMap.prototype.get = function (key) {
    const table = this.tables[hash(key)];
    const pair = table.find((pair) => pair[0] === key);
    return pair ? pair[1] : -1;
};

/**
 * @param {number} key
 * @return {void}
 */
MyHashMap.prototype.remove = function (key) {
    const table = this.tables[hash(key)];
    const idx = table.findIndex((pair) => pair[0] === key);
    if (idx !== -1) table.splice(idx, 1);
};

/**
 * Your MyHashMap object will be instantiated and called as such:
 * var obj = new MyHashMap()
 * obj.put(key,value)
 * var param_2 = obj.get(key)
 * obj.remove(key)
 */
