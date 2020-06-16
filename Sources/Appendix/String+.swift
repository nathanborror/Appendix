import Foundation

extension String {
    
    public var utf8String: UnsafePointer<Int8>? {
        return (self as NSString).utf8String
    }
    
    public func replace(regex: String, with replace: String) -> String {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let range = NSRange(self.startIndex..., in: self)
            return regex.stringByReplacingMatches(in: self, range: range, withTemplate: replace)
        } catch {
            print("Invalid regex: \(error)")
            return self
        }
    }

    public func match(regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let range = NSRange(self.startIndex..., in: self)
            let results = regex.matches(in: self, range: range)
            return results.map { String(self[Range($0.range, in: self)!]) }
        } catch {
            print("Invalid regex: \(error)")
            return []
        }
    }

    public func trim(to max: Int) -> String {
        return "\(self[..<index(startIndex, offsetBy: max)])" + "..."
    }
}
