import XCTest
@testable import TBEnglishWords

final class TBEnglishWordsTests: XCTestCase {
}

struct TestFixture {
    var word: String { "sensor" }
    var ordinal: Int { 4971 }
    
    var commonWordJSON: String {
        """
          {
            "ordinal" : 4971,
            "text" : "sensor"
          }
        """
    }
    
    func makeCommonWord() -> CommonWord {
        CommonWord(text: word, ordinal: ordinal)
    }
    
    func makeEmptyCommonWord() -> CommonWord {
        CommonWord(text: "", ordinal: 0)
    }
}
