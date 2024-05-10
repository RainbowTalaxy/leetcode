/**
 * @param {number[]} batteryPercentages
 * @return {number}
 */
var countTestedDevices = function (batteryPercentages) {
    let result = 0,
        duration = 0;
    batteryPercentages.forEach((b) => {
        if (b - duration > 0) {
            result += 1;
            duration += 1;
        }
    });
    return result;
};
