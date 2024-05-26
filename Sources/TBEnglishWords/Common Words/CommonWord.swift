import Foundation

public struct CommonWord: Hashable, Identifiable, Codable {
    /// The word's contents.
    public let text: String

    /// Represents how common the word is in everyday use. Lower
    /// numbers have a higher ranking (i.e. a word with an `ordinal` value
    /// of  `1` means it occurs more often than a word with a value of `2`
    /// or `5` or `4793`).
    public let ordinal: Int
    
    // MARK: - Identifiable
    public var id: Int {
        text.hash
    }
    
    // MARK: - API
    /// Returns `true` if this word's `text` has an empty value.
    public var isEmpty: Bool {
        text.isEmpty
    }
}
