import XCTest
@testable import FilenameRenamer

final class TrimEndFilenameRenamerTests: XCTestCase {
  let context = RenameOpContext(count: 0)
  func testTrimEndFilenameRenamer() throws {
    
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 0,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "1234567"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 1,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "123456"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 2,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "12345"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 3,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "1234"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 4,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "123"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 5,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "12"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 6,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      "1"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 7,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      ""
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 8,
        includeExtension: false
      ).rename(filename: "1234567", context: context),
      ""
    )
  }
  
  func testTrimsExtensions() throws {
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 0,
        includeExtension: true
      ).rename(filename: "1234.ext", context: context),
      "1234.ext"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 1,
        includeExtension: true
      ).rename(filename: "1234.ext", context: context),
      "1234.ex"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 2,
        includeExtension: true
      ).rename(filename: "1234.ext", context: context),
      "1234.e"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 3,
        includeExtension: true
      ).rename(filename: "1234.ext", context: context),
      "1234."
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 4,
        includeExtension: true
      ).rename(filename: "1234.ext", context: context),
      "1234"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 5,
        includeExtension: true
      ).rename(filename: "1234.ext", context: context),
      "123"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 6,
        includeExtension: true
      ).rename(filename: "1234.ext", context: context),
      "12"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 7,
        includeExtension: true
      ).rename(filename: "1234.ext", context: context),
      "1"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 8,
        includeExtension: true
      ).rename(filename: "1234.ext", context: context),
      ""
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 9,
        includeExtension: true
      ).rename(filename: "1234.ext", context: context),
      ""
    )
  }
  
  func testTrimSkipsExtensions() throws {   
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 0,
        includeExtension: false
      ).rename(filename: "1234.ext", context: context),
      "1234.ext"
    )
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 1,
        includeExtension: false
      ).rename(filename: "1234.ext", context: context),
      "123.ext"
    )
    
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 2,
        includeExtension: false
      ).rename(filename: "1234.ext", context: context),
      "12.ext"
    )
    
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 3,
        includeExtension: false
      ).rename(filename: "1234.ext", context: context),
      "1.ext"
    )
    
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 4,
        includeExtension: false
      ).rename(filename: "1234.ext", context: context),
      ".ext"
    )
    
    
    XCTAssertEqual(
      TrimEndFilenameRenamer(
        characters: 5,
        includeExtension: false
      ).rename(filename: "1234.ext", context: context),
      ".ext"
    )
  }
}
