import XCTest
import os
@testable import TBEnglishWords

/// Validation of `CommonWord`.
final class CommonWordTests: XCTestCase {
    private let fixture = TestFixture()
    private let decoder = JSONDecoder()
    
    /// Validates that `init(text:ordinal:)` correctly captures the given parameters.
    func test_init()  throws {
        let expectedText = fixture.word
        let expectedOrdinal = fixture.ordinal
        
        let sut = CommonWord(text: expectedText, ordinal: expectedOrdinal)
        XCTAssertEqual(sut.text, expectedText)
        XCTAssertEqual(sut.ordinal, expectedOrdinal)
    }
    
    /// Validates that `CommonWord` can correctly decode from JSON.
    func test_decodable() throws {
        let expectedText = fixture.word
        let expectedOrdinal = fixture.ordinal
    
        let data = try XCTUnwrap(fixture.commonWordJSON.data(using: .utf8))
        let sut = try decoder.decode(CommonWord.self, from: data)
        
        XCTAssertEqual(sut.text, expectedText)
        XCTAssertEqual(sut.ordinal, expectedOrdinal)
    }
    
    /// Validates that `id` is unique to each word.
    func test_identifiable() throws {
        let wordA = "wordA"
        let ordinalA = 1234
        let sutA = CommonWord(text: wordA, ordinal: ordinalA)
        
        let wordB = "wordB"
        let ordinalB = 2345
        let sutB = CommonWord(text: wordB, ordinal: ordinalB)
        XCTAssertNotEqual(sutA.id, sutB.id)
    }
    
    /// Validates that `isEmpty` returns `true` when the word is empty.
    func test_isEmpty_true() throws {
        let sut = fixture.makeEmptyCommonWord()
        XCTAssertTrue(sut.isEmpty)
    }
    
    /// Validates that `isEmpty` returns `false` when the word is not empty.
    func test_isEmpty_false() throws {
        let sut = fixture.makeCommonWord()
        XCTAssertFalse(sut.isEmpty)
    }
}
