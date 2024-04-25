/**
 * @param {number} mainTank
 * @param {number} additionalTank
 * @return {number}
 */
var distanceTraveled = function (mainTank, additionalTank) {
    let restMain = mainTank,
        restAddi = additionalTank;
    let total = 0;
    while (restMain >= 5 && restAddi >= 1) {
        total += 5;
        restMain -= 4;
        restAddi -= 1;
    }
    return (total + restMain) * 10;
};
