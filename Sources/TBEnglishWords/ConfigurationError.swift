import Foundation

/// Indicates an error occurred when configuring the system.
public enum ConfigurationError: Error {
    case jsonFileNotFound(String)
    case unableToLoadContents(String)
    case convertToDataFailed
}
