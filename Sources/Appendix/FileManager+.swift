import Foundation

public extension FileManager {

    static func save(data: Data, at path: String) throws {
        if FileManager.default.fileExists(atPath: path) {
            try FileManager.default.removeItem(atPath: path)
        }
        try data.write(to: URL(fileURLWithPath: path))
    }
    
    static func save(content: String, at path: String) throws {
        if FileManager.default.fileExists(atPath: path) {
            try FileManager.default.removeItem(atPath: path)
        }
        try content.write(to: URL(fileURLWithPath: path), atomically: true, encoding: .utf8)
    }
    
    static func delete(at path: String) throws {
        guard FileManager.default.fileExists(atPath: path) else {
            throw NSError(domain: "File does not exist", code: -1, userInfo: nil)
        }
        try FileManager.default.removeItem(atPath: path)
    }
    
    static func rename(filename: String, newFilename: String) throws {
        try FileManager.default.moveItem(atPath: filename, toPath: newFilename)
    }
    
    static func copy(filename: String, to newFilename: String) throws {
        try FileManager.default.copyItem(atPath: filename, toPath: newFilename)
    }
    
    static var document: String {
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    static var library: String {
        NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
    }
    
    static var temporary: String {
        NSTemporaryDirectory()
    }
    
    static var caches: String {
        NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
}
