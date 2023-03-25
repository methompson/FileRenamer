import XCTest
@testable import FilenameRenamer

final class TrimStartFilenameRenamerTests: XCTestCase {
  let context = RenameOpContext(count: 0)
  
  func testTrimsWithoutExtensions() throws {
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 0,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "1234567"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 1,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "234567"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 2,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "34567"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 3,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "4567"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 4,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "567"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 5,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "67"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 6,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "7"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 7,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      ""
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 8,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      ""
    )
  }
  
  func testTrimsExtensions() throws {
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 0,
        includeExtension: true
      ).rename(filename: "1234.abc", context: context),
      "1234.abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 1,
        includeExtension: true
      ).rename(filename: "1234.abc", context: context),
      "234.abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 2,
        includeExtension: true
      ).rename(filename: "1234.abc", context: context),
      "34.abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 3,
        includeExtension: true
      ).rename(filename: "1234.abc", context: context),
      "4.abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 4,
        includeExtension: true
      ).rename(filename: "1234.abc", context: context),
      ".abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 5,
        includeExtension: true
      ).rename(filename: "1234.abc", context: context),
      "abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 6,
        includeExtension: true
      ).rename(filename: "1234.abc", context: context),
      "bc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 7,
        includeExtension: true
      ).rename(filename: "1234.abc", context: context),
      "c"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 8,
        includeExtension: true
      ).rename(filename: "1234.abc", context: context),
      ""
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 9,
        includeExtension: true
      ).rename(filename: "1234.abc", context: context),
      ""
    )
    
  }
  
  func testTrimSkipsExtensions() throws {
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 0,
        includeExtension: false
      ).rename(filename: "1234.abc", context: context),
      "1234.abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 1,
        includeExtension: false
      ).rename(filename: "1234.abc", context: context),
      "234.abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 2,
        includeExtension: false
      ).rename(filename: "1234.abc", context: context),
      "34.abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 3,
        includeExtension: false
      ).rename(filename: "1234.abc", context: context),
      "4.abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 4,
        includeExtension: false
      ).rename(filename: "1234.abc", context: context),
      ".abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 5,
        includeExtension: false
      ).rename(filename: "1234.abc", context: context),
      ".abc"
    )
    
    XCTAssertEqual(
      TrimStartFilenameRenamer(
        characters: 6,
        includeExtension: false
      ).rename(filename: "1234.abc", context: context),
      ".abc"
    )
  }
}

