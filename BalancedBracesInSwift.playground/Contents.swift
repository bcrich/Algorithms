import Foundation

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