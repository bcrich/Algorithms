import Foundation

func fib(_ n: Int, dict: inout [Int: Int]) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }

    guard dict[n] == nil else {
        return dict[n]!
    }

    dict[n] = fib(n-1, dict: &dict) + fib(n-2, dict: &dict)

    return dict[n]!
}

var dict = [Int: Int]()

fib(16, dict: &dict)