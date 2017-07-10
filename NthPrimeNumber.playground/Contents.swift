import Foundation

func nthPrimeNumber(_ n: Int) -> Int {
    var primes = [Int]()
    var m = 0
    var threshold = n * 10

    for i in 2..<threshold {
        for j in 2..<i {
            if i % j == 0 {
                m = 1
                break
            } else {
                m = 0
            }
        }
        if m == 0 {
            primes.append(i)
        }
    }
    print("\(primes.count)")
    return primes[n]
}


nthPrimeNumber(99)