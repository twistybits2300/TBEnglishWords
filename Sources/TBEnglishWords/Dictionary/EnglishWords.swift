import Foundation

@Observable
@available(iOS 17.0, macOS 14.0, *)
/// Represents a dictionary of `~120K` English words.
public final class EnglishWords {
    /// The set of English words in this dictionary.
    public private(set) var words = Set<WordEntry>()

    /// The file that houses the JSON we'll load and parse at `.init()`.
    private let wordsFilename = "word_entries"

    // MARK: - Initialization
    public init() throws {
        let data = try Bundle.loadData(filename: wordsFilename)
        let decodedWords = try decodeWords(from: data)
        self.words = Set(decodedWords)
    }
    
    // MARK: - Utilities
    private func decodeWords(from data: Data) throws -> [WordEntry] {
        try JSONDecoder().decode([WordEntry].self, from: data)
    }
}
