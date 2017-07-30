import Foundation

public struct Regex {
    public static let mirror = "(?:(\\w)(\\w)\\2\\1)"
    public static let repeating = "(?:(\\w)(\\w)\\1\\1)"
    public static let braces = "\\[(?:(\\w)(\\w)\\2\\1)\\]"
}
