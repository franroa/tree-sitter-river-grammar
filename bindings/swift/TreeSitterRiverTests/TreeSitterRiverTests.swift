import XCTest
import SwiftTreeSitter
import TreeSitterRiver

final class TreeSitterRiverTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_river())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading River grammar")
    }
}
