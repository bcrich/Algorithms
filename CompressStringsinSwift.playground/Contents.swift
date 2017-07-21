import Foundation

func compressStrings(_ s: String) -> String {

    var result = ""
    var stack = [Character]()
    var count = 0

    for char in s.characters {
        if stack.isEmpty {
            stack.append(char)
            count += 1
        } else {
            if char == stack.last {
                stack.append(char)
                count += 1
            } else {
                result = result + String(stack.last!) + String(count)
                count = 0
                stack.removeAll()
                stack.append(char)
                count += 1
            }
        }
    }

    if !stack.isEmpty {
        result = result + String(stack.last!) + String(count)
    }

    return result
}

compressStrings("AAABBBCC")
compressStrings("AAABFFFCC")
