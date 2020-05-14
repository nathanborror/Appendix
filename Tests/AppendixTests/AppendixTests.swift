import XCTest
@testable import Appendix

final class AppendixTests: XCTestCase {
    func testExample() {
        let now = Date()
        XCTAssertEqual(now.format("YYYY"), "2020")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
