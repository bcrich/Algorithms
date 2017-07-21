func longestConsecutive(_ s: [Int]) -> Int {
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

longestConsecutive([1,2,5,3,6,7,8])
