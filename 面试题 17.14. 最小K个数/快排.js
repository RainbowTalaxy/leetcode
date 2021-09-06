var smallestK = function(arr, k) {
    const fake_qsort = (left, right) => {
        if (left < right) {
            let pivot = arr[left], i = left, j = right
            while (i < j) {
                while (i < j && pivot <= arr[j]) { j -= 1 }
                arr[i] = arr[j]
                while (i < j && pivot >= arr[i]) { i += 1 }
                arr[j] = arr[i]
            }
            arr[i] = pivot
            if (i + 1 < k) {
                fake_qsort(i + 1, right)
            } else if (i + 1 > k) {
                fake_qsort(left, i - 1)
            }
        }
    }
    fake_qsort(0, arr.length - 1)
    return arr.slice(0, k)
};