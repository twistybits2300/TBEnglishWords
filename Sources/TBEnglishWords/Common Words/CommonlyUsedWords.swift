import Foundation
import TBCommon

@Observable
@available(iOS 17.0, macOS 14.0, *)
/// Contains a set of `~5K` of the most commonly 
/// used words in the English language.
public final class CommonlyUsedWords {
    /// The set of commonly used English words.
    public private(set) var words = Set<CommonWord>()
    
    /// The file that houses the JSON we'll load and parse at `.init()`.
    private let normalizedFilename = "words_normalized"

    // MARK: - Initialization
    /// Default initializer.
    public init() throws {
        let data = try Bundle.loadData(filename: normalizedFilename)
        let decodedWords = try decodeWords(from: data)
        self.words = Set(decodedWords)
    }
    
    // MARK: - Utilities
    private func decodeWords(from data: Data) throws -> [CommonWord] {
        try JSONDecoder().decode([CommonWord].self, from: data)
    }
}
