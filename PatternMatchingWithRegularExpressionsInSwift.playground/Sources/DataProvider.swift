import Foundation

public protocol DataProvidingProtocol {
    func loadDatafromFile() -> [String]
}

public struct DataProvider: DataProvidingProtocol {
    private var fileName: String

    public init(filename: String) {
        self.fileName = filename
    }
    
    // Read data from file and return the strings
    public func loadDatafromFile() -> [String] {
        if let path = Bundle.main.path(forResource: fileName, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let inputStrings = data.components(separatedBy: .newlines)
                return inputStrings
            } catch {
                print("Error:\(error.localizedDescription)")
            }
        }
        return []
    }
}
