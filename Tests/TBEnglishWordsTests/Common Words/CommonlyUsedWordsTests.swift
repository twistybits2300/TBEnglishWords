import XCTest
import os
@testable import TBEnglishWords

/// Validation of `CommonlyUsedWords`.
@available(macOS 14.0, *)
final class CommonlyUsedWordsTests: XCTestCase {
    private let fixture = TestFixture()
    
    /// Validates that `init()` is able to load the words from the bundle file.
    func test_init_loads_words() throws {
        let sut = try CommonlyUsedWords()
        XCTAssertFalse(sut.words.isEmpty)
    }
}
