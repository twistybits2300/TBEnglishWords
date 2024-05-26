import XCTest
import os
@testable import TBEnglishWords

/// Validation of `WordEntry`.
final class WordEntryTests: XCTestCase {
    private let fixture = TestFixture()
    private let decoder = JSONDecoder()

    /// Validates that `WordEntry` can be decoded from JSON.
    func test_decodable() throws {
        let expectedGrammar = PartOfSpeech.noun
        let data = try XCTUnwrap(fixture.singleMeaningWordJSON.data(using: .utf8))
        let sut = try decoder.decode(WordEntry.self, from: data)
        
        let meaning = try XCTUnwrap(sut.meanings.first)
        XCTAssertEqual(meaning.definition, fixture.expectedDefinition)
        XCTAssertEqual(meaning.partOfSpeech, expectedGrammar)
        XCTAssertEqual(meaning.clarification, fixture.expectedClarification)
    }
}

private extension TestFixture {
    var expectedDefinition: String {
        "nocturnal burrowing mammal of the grasslands of Africa that feeds on termites; sole extant representative of the order Tubulidentata"
    }
    
    var expectedClarification: [String] {
        [
            "Placental",
            "Placental mammal",
            "Eutherian",
            "Eutherian mammal"
        ]
    }
    
    var singleMeaningWordJSON: String {
        """
        {
            "antonyms": [
            ],
            "meanings": [
                {
                    "clarification": [
                        "Placental",
                        "Placental mammal",
                        "Eutherian",
                        "Eutherian mammal"
                    ],
                    "definition": "nocturnal burrowing mammal of the grasslands of Africa that feeds on termites; sole extant representative of the order Tubulidentata",
                    "examples": [
                    ],
                    "partOfSpeech": "noun"
                }
            ],
            "synonyms": [
                "orycteropus afer",
                "ant bear",
                "anteater",
                "aardvark"
            ],
            "word": "aardvark"
        }
        """
    }
}
