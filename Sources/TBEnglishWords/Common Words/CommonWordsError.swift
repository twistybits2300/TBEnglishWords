import Foundation

public enum CommonWordsError: Error {
    case jsonFileNotFound(String)
    case unableToLoadContents(String)
    case convertToDataFailed
}
