import Foundation

// cool solution
func isMatched(_ e: String) -> Bool {
    var e = e
    let t = e

    while e.characters.count > 0 {
        e = e.replacingOccurrences(of: "()", with: "")
        e = e.replacingOccurrences(of: "[]", with: "")
        e = e.replacingOccurrences(of: "{}", with: "")
        if t == e { return false }
    }
    return true
}

print(isMatched("{[({})]}"))
print(isMatched("{{([)]}}"))


// Solution using data structures
func balancedBraces(_ s: String) -> Bool {
    var stack = [Character]()

    for char in s.characters {
        switch char {
        case "{":
            stack.append("{")
        case "}":
            if stack.last == Character("{") {
                stack.removeLast()
            } else {
                stack.append("}")
            }
        case "[":
            stack.append("[")
        case "]":
            if stack.last == Character("[") {
                stack.removeLast()
            } else {
                stack.append("]")
            }
        case "(":
            stack.append("(")
        case ")":
            if stack.last == Character("(") {
                stack.removeLast()
            } else {
                stack.append(")")
            }
        default:
            break
        }
    }

    return stack.isEmpty
}

balancedBraces("{[()]}")
balancedBraces("{}[]()")
balancedBraces("{}[()]()")
balancedBraces("{(})[]()")
print(isMatched("{[({})]}"))
print(isMatched("{{([)]}}"))
