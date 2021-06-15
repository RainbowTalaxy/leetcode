function peakIndexInMountainArray(arr: number[]): number {
    function check(i: number): number {
        if (arr[i-1] < arr[i] && arr[i] < arr[i+1]) {
            return -1
        } else if (arr[i-1] > arr[i] && arr[i] > arr[i+1]) {
            return 1
        } else {
            return 0
        }
    }

    let l = 1, r = arr.length - 1
    while (l < r) {
        const m = Math.floor((l + r) / 2), pos = check(m)
        if (pos == -1) {
            l = m + 1
        } else if (pos == 1) {
            r = m
        } else {
            return m
        }
    }
    return l
};