import Foundation

/// Represents a word in a dictionary.
public struct WordEntry: Hashable, Codable {
    /// The dictionary word.
    public let word: String
    
    /// The word's meaning. May have multiple meanings.
    public var meanings: [WordMeaning]
    
    /// Synonyms of the word. May be empty.
    public var synonyms: [String]

    /// Antonyms of the word. May be empty.
    public var antonyms: [String]
}
