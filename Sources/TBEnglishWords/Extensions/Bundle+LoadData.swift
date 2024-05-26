import Foundation

extension Bundle {
    static func loadData(filename: String) throws -> Data {
        guard let path = Bundle.module.path(forResource: filename, ofType: "json") else {
            throw ConfigurationError.jsonFileNotFound(filename)
        }

        guard let contents = try? String(contentsOf: URL(fileURLWithPath: path)) else {
            throw ConfigurationError.unableToLoadContents(filename)
        }

        guard let data = contents.data(using: .utf8) else {
            throw ConfigurationError.convertToDataFailed
        }
        
        return data
    }
}
