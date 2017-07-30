import Foundation

public protocol PatternMatching {
    func matchStringWithRegex(_ text: String, _ regex: String) -> [String]
    func printMatchedPatterns()
    func fetchMatchedPatterns(_ data: [String]) -> ([String],Int)
}

public class PatternMatcher: PatternMatching {
    private var count = 0
    private let dataProvider: DataProvidingProtocol

    // constructor injecting data provider
    public init(_ dataProvider: DataProvidingProtocol) {
        self.dataProvider = dataProvider
    }

    // print all the matched patterns per requirements
    public func printMatchedPatterns() {
        print("Matched Strings are:\n")
        let (results, count) = fetchMatchedPatterns(dataProvider.loadDatafromFile())
        print(results)
        print("\nThe number of lines with valid patterns is: \(count) \n \n")
    }

    public func fetchMatchedPatterns(_ data: [String]) -> ([String],Int) {
        var results = [String]()
        for input in dataProvider.loadDatafromFile() {
            if matchStringWithRegex(input, Regex.braces).count == 0 &&
                matchStringWithRegex(input, Regex.repeating).count == 0 &&
                !matchStringWithRegex(input, Regex.mirror).isEmpty {
                for matchedString in matchStringWithRegex(input, Regex.mirror) {
                    results.append(matchedString)
                }
                count += 1
            }
        }
        return (results,count)
    }

    // Match the patterns using regular expression API in iOS
    public func matchStringWithRegex(_ text: String, _ regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let string = text as NSString
            let results = regex.matches(in: text, range: NSRange(location: 0, length: string.length))
            return results.map { string.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
