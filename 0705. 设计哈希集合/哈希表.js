function hash(key) {
    return key % 1000;
}

var MyHashSet = function () {
    this.set = Array(1000)
        .fill(null)
        .map((_) => []);
};

/**
 * @param {number} key
 * @return {void}
 */
MyHashSet.prototype.add = function (key) {
    if (this.contains(key)) return;
    this.set[hash(key)].push(key);
};

/**
 * @param {number} key
 * @return {void}
 */
MyHashSet.prototype.remove = function (key) {
    if (!this.contains(key)) return;
    const idx = this.set[hash(key)].findIndex((k) => k === key);
    this.set[hash(key)].splice(idx, 1);
};

/**
 * @param {number} key
 * @return {boolean}
 */
MyHashSet.prototype.contains = function (key) {
    return this.set[hash(key)].includes(key);
};

/**
 * Your MyHashSet object will be instantiated and called as such:
 * var obj = new MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * var param_3 = obj.contains(key)
 */
