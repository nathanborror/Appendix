import Foundation

extension Double {

    /// Returns a human readable double string (i.e. 1.2 or 1.23)
    public var humanize: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfUp
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self))!
    }
}
