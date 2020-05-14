import Foundation

public extension Date {
    
    /// Format used in SQLite tables.
    static let SQLITE_FORMAT = "yyyy-MM-dd HH:mm:ss+00:00"
    
    /// Format for when you just want an integer of the date.
    static let DATE_INTEGER_FORMAT = "yyyyMMdd"
    
    /// Returns format appropriate for Sqlite3 (e.g. 2006-01-02 15:06:00+00:00)
    var sqliteFormat: String {
        return format(Self.SQLITE_FORMAT)
    }
    
    /// Returns a weekday integer 1 through 7 — 1 is Monday
    var weekdayInt: Int {
        let calendar = Calendar(identifier: .gregorian)
        let day = calendar.component(.weekday, from: self)
        return (day == 1) ? 7 : day - 1
    }
    
    /// Returns a month integer 1 through 12 — 1 is January.
    var monthInt: Int {
        let calendar = Calendar(identifier: .gregorian)
        let month = calendar.component(.month, from: self)
        return month
    }
    
    /// Returns a date integer (i.e. 20200501)
    var dateInt: Int {
        return Int(format(Self.DATE_INTEGER_FORMAT)) ?? 0
    }
    
    /**
     Returns a date string for the given format.
     
     - Parameters:
        - format: The format you want the date
     - Returns: A formatted date string
     
     ## Year
        ```
        y       2008
        yy      08
        yyyy    2008
        ```
     ## Quarter
        ```
        Q       4
        QQQ     Q4
        QQQQ    4th quarter
        ```
     ## Month
        ```
        M       12
        MM      12
        MMM     Dec
        MMMM    December
        MMMMM   D
        ```
     ## Day
        ```
        d       14
        dd      14
        F       3rd Tuesday in December
        E       Tue
        EEEE    Tuesday
        EEEEE   T
        EEEEEE  Tu
        ```
     ## Hour
        ```
        h       4
        hh      04
        H       16
        HH      16
        a       PM
        ```
     ## Minute
        ```
        m       35
        mm      35
        ```
     ## Second
        ```
        s       8
        ss      08
        SSS     1234
        ```
     ## Timezone
        ```
        zzz     CST
        zzzz    Central Standard Time
        ZZZZ    CST-06:00
        Z       -0600
        ZZZZZ   -06:00
        ```
    */
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// Returns a date for a given date format
    static func parse(_ date: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: date)
    }
}

