struct Interval {
    let start: Int
    let end: Int
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

let i1 = Interval(1,5)
let i2 = Interval(2,8)
let i3 = Interval(5,12)
let i4 = Interval(14,18)

func mergeIntervals(_ intervals: [Interval]) -> [Interval] {
    var stack = [Interval]()
    for i in 0..<intervals.count {
        if stack.isEmpty {
            stack.append(intervals[i])
        } else {
            let pop = stack.removeLast()
            if intervals[i].start > (pop.start) && intervals[i].start < (pop.end) {
                let push = Interval((pop.start), intervals[i].end)
                stack.append(push)
            } else {
                stack.append(pop)
                stack.append(intervals[i])
            }
        }
    }

    return stack
}

print(mergeIntervals([i1,i2,i3,i4]))