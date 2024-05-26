import Foundation
import TBCommon

/// Contains a set of `~5K` of the most commonly 
/// used words in the English language.
@Observable
@available(macOS 14.0, *)
public final class CommonlyUsedWords {
    public private(set) var words = Set<CommonWord>()
    private let normalizedFilename = "words_normalized"

    /// Default initializer.
    public init() throws {
        let data = try loadWords(filename: normalizedFilename)
        let decodedWords = try decodeWords(from: data)
        self.words = Set(decodedWords)
    }
    
    // MARK: - Utilities
    private func loadWords(filename: String) throws -> Data {
        guard let path = Bundle.module.path(forResource: filename, ofType: "json") else {
            throw CommonWordsError.jsonFileNotFound(filename)
        }

        guard let contents = try? String(contentsOf: URL(fileURLWithPath: path)) else {
            throw CommonWordsError.unableToLoadContents(filename)
        }

        guard let data = contents.data(using: .utf8) else {
            throw CommonWordsError.convertToDataFailed
        }
        
        return data
    }
    
    private func decodeWords(from data: Data) throws -> [CommonWord] {
        try JSONDecoder().decode([CommonWord].self, from: data)
    }
}
