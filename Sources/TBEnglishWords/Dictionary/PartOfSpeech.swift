import Foundation

/// Identifies the part of English grammar a word belongs to.
public enum PartOfSpeech: String, Hashable, Codable {
    case noun
    case pronoun
    case verb
    case adjective
    case adverb
    case preposition
    case conjunction
    case interjection
    case unknown
}

