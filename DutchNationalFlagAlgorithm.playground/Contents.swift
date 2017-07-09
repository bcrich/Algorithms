func dutchNationalFlagProblem(_ a: [Int]) -> [Int] {
    var a = a
    var m = 0
    var f = 0
    var e = a.count - 1

    while f < e {
        if a[f] == 0 {
            let temp = a[m]
            a[m] = a[f]
            a[f] = temp
            m += 1
        } else if a[e] == 0 {
            let temp = a[m]
            a[m] = a[e]
            a[e] = temp
            m += 1
        } else if a[e] % 2 == 0 {
            e -= 1
        } else if a[f] % 2 == 1 {
            f += 1
        } else if a[e] % 2 == 1 && a[f] % 2 == 0 {
            let temp = a[e]
            a[e] = a[f]
            a[f] = temp
        }
    }

    return a
}

let a = [2,3,0,1,0,04,7,1,8,3,3,1,10]
dutchNationalFlagProblem(a)