//Divide two numbers without using division or multiplication or mod

import UIKit

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    var dividend = dividend
    var divisor = divisor
    var quotient = 0
    var isNegativeDividend = false
    var isNegativeDivisor = false

    if dividend > Int.min && dividend < Int.max {
        if dividend < 0 {
            isNegativeDividend = true
            dividend = -(dividend)
        }

        if divisor < 0 {
            isNegativeDivisor = true
            divisor = -divisor
        }

        if dividend > Int.max {
            return Int.max
        }

        while dividend >= divisor {
            dividend = dividend - divisor
            quotient += 1
        }

        if isNegativeDivisor || isNegativeDividend {
            quotient = -quotient
        }

        if isNegativeDivisor && isNegativeDividend {
            quotient = -quotient
        }

        return quotient
    } else {
        return Int.max
    }
}

print(divide(-9223372036854775808, -1))



