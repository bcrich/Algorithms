func longestConsecutive(_ nums: [Int]) -> Int {
    var s = nums
    var ans = 0
    for i in 0..<s.count {
        if !s.contains(s[i] - 1) {
            var j = s[i]
            while s.contains(j) {
                j+=1
            }
            ans = max(ans, j - s[i])
        }
    }
    return ans
}

longestConsecutive([1,9,4,5,6,8,7,2])