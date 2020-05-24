import Foundation

extension FileManager {

    public static func save(data: Data, at path: String) throws {
        if FileManager.default.fileExists(atPath: path) {
            try FileManager.default.removeItem(atPath: path)
        }
        try data.write(to: URL(fileURLWithPath: path))
    }
    
    public static func save(content: String, at path: String) throws {
        if FileManager.default.fileExists(atPath: path) {
            try FileManager.default.removeItem(atPath: path)
        }
        try content.write(to: URL(fileURLWithPath: path), atomically: true, encoding: .utf8)
    }
    
    public static func delete(at path: String) throws {
        guard FileManager.default.fileExists(atPath: path) else {
            throw NSError(domain: "File does not exist", code: -1, userInfo: nil)
        }
        try FileManager.default.removeItem(atPath: path)
    }
    
    public static func rename(filename: String, newFilename: String) throws {
        try FileManager.default.moveItem(atPath: filename, toPath: newFilename)
    }
    
    public static func copy(filename: String, to newFilename: String) throws {
        try FileManager.default.copyItem(atPath: filename, toPath: newFilename)
    }
    
    public static var document: String {
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    public static var library: String {
        NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
    }
    
    public static var temporary: String {
        NSTemporaryDirectory()
    }
    
    public static var caches: String {
        NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
}
