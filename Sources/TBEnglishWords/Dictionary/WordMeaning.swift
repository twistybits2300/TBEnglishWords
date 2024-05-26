import Foundation

/// Encapsulated meaning of a word, including its grammar identifier,
/// a definition, optionally with further clarification and examples.
public struct WordMeaning: Codable {
    /// The grammar identifier (noun, adjective, etc.)
    public let partOfSpeech: PartOfSpeech
    
    /// A definition of the word.
    public let definition: String
    
    /// Further clarification of the word. May be empty.
    public let clarification: [String]
    
    /// Some examples of the word. May be empty.
    public let examples: [String]
}
