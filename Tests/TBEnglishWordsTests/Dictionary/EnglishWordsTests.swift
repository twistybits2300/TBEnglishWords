import XCTest
import TBCommon
import os
@testable import TBEnglishWords

/// Validation of `EnglishWords`.
@available(iOS 17.0, macOS 14.0, *)
final class EnglishWordsTests: XCTestCase {
    private let fixture = TestFixture()
    private let log = Logger.testing
    
    /// Validates that `init()` is able to load the words from the bundle file.
    func test_init_loads_words() throws {
        let sut = try EnglishWords()
        XCTAssertFalse(sut.words.isEmpty)
        log.debug("\(sut.words.count.formatted()) words processed")
    }
}
