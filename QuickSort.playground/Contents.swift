import Foundation

class Sort {
    func QuickSort(_ array: inout [Int], _ low: Int, _ high: Int) {
        if low < high {
            let partitionIndex = partition(&array, low, high)
            QuickSort(&array, low, partitionIndex - 1)
            QuickSort(&array, partitionIndex + 1, high)
        }
    }

    private func partition(_ array: inout [Int], _ low: Int, _ high: Int) -> Int {
        var i = low - 1
        let pivot = array[high]
        for j in low..<high {
            if pivot >= array[j] {
                i = i + 1
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
        let temp = array[high]
        array[high] = array[i+1]
        array[i+1] = temp
        return i+1
    }
}

let sort = Sort()
var array = [45,87,43,23,90,144,87,56,34,98,10,18,22]
sort.QuickSort(&array, 0, array.count - 1)
print(array)