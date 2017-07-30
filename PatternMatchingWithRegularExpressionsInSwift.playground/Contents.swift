import Foundation
//import XCTest

// instantiate the data provider class to read the data from file
let dataProvider = DataProvider(filename: "input")

// inject data provider and the regex into the pattern matcher's constructor
let patternMatcher = PatternMatcher(dataProvider)

// print the matched patterns
patternMatcher.printMatchedPatterns()

// Run the unit tests
PatternMatcherTests.defaultTestSuite().run()


