import Foundation

extension String {
    
    public var utf8String: UnsafePointer<Int8>? {
        return (self as NSString).utf8String
    }
}
