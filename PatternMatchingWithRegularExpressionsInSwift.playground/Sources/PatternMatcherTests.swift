import Foundation
import XCTest

public class PatternMatcherTests: XCTestCase {

    // Mock data provider with dummy data with matches
    class MockDataProvider: DataProvidingProtocol {
        func loadDatafromFile() -> [String] {
            return ["rttr[xccx]klkiou",
                    "bggbkiujhwpl",
                    "[hyyh]njhgbllj[huuh]",
                    "aaaa[abba]",
                    "vppvcqqc"]
        }
    }

    // Mock data provider with dummy data that gives results in no matches
    class MockDataProviderWithNoMatches: DataProvidingProtocol {
        func loadDatafromFile() -> [String] {
            return ["rttr[xccx]klkiou",
                    "bggbkiujhwpl[abba]",
                    "[hyyh]njhgbllj[huuh]",
                    "aaaa[abba]",
                    "[vppv]cqqc"]
        }
    }

    // Mock data provider with no data
    class MockDataProviderWithNoData: DataProvidingProtocol {
        func loadDatafromFile() -> [String] {
            return []
        }
    }

    func testPatternMatcherWithValidData() {
        let dataProvider = MockDataProvider()
        let matcher = PatternMatcher(dataProvider)
        let (results,count) = matcher.fetchMatchedPatterns(dataProvider.loadDatafromFile())
        XCTAssertEqual(results.count,3)
        XCTAssertEqual(results, ["bggb","vppv","cqqc"])
        XCTAssertEqual(count, 2)
    }

    func testPatternMatcherWithNoData() {
        let dataProvider = MockDataProviderWithNoData()
        let matcher = PatternMatcher(dataProvider)
        let (results,count) = matcher.fetchMatchedPatterns(dataProvider.loadDatafromFile())
        XCTAssertEqual(results.count, 0)
        XCTAssertEqual(results, [])
        XCTAssertEqual(count, 0)
    }

    func testPatternMatcherWithNoMatches() {
        let dataProvider = MockDataProviderWithNoMatches()
        let matcher = PatternMatcher(dataProvider)
        let (results,count) = matcher.fetchMatchedPatterns(dataProvider.loadDatafromFile())
        XCTAssertEqual(results.count, 0)
        XCTAssertEqual(results, [])
        XCTAssertEqual(count, 0)
    }
}
