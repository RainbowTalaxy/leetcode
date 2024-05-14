/**
 * @param {number[]} tasks
 * @return {number}
 */
var minimumRounds = function (tasks) {
    const map = new Map();
    tasks.forEach((task) => {
        map.set(task, (map.get(task) ?? 0) + 1);
    });
    let result = 0;
    const counts = map.values();
    for (let count of counts) {
        if (count < 2) return -1;
        result += Math.ceil(count / 3);
    }
    return result;
};
