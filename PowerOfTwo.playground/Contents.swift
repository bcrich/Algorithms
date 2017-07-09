func powerOf2(_ n: Int) -> Bool {
    if n == 0 {
        return false
    }
    return n & (n-1) == 0
}
powerOf2(64)


func findPowersOf2(_ n: [Int]) -> [Int] {
    var result = [Int]()
    for i in n {
        if i > 1 && i & (i-1) == 0 {
            result.append(i)
        }
    }
    return result
}

findPowersOf2([1,2,3,4,5,6,7,8,0,-1,-2])