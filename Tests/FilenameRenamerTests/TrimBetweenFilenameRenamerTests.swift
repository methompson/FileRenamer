//
//  File.swift
//  
//
//  Created by Mathew Thompson on 3/21/23.
//

import XCTest
@testable import FilenameRenamer

final class TrimBetweenFilenameRenamerTests: XCTestCase {
  let context = RenameOpContext(count: 0)
  
  func testTrimBetweenFilenameRenamer() throws {
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 2,
        characters: 2,
        startFromEnd: false,
        includeExtension: false
      ).rename(
        filename: "1234.567",
        context: context
      ),
      "12.567"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 1,
        characters: 2,
        startFromEnd: true,
        includeExtension: true
      ).rename(
        filename: "1234.567",
        context: context
      ),
      "1234.7"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 1,
        characters: 2,
        startFromEnd: true,
        includeExtension: false
      ).rename(
        filename: "1234.567",
        context: context
      ),
      "14.567"
    )
  }
  
  func testTrimZeroIndex() throws {
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 0,
        characters: 2,
        startFromEnd: false,
        includeExtension: false
      ).rename(filename: "1234.567", context: context),
      "34.567"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 0,
        characters: 2,
        startFromEnd: true,
        includeExtension: false
      ).rename(filename: "1234.567", context: context),
      "12.567"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 0,
        characters: 2,
        startFromEnd: true,
        includeExtension: true
      ).rename(filename: "1234.567", context: context),
      "1234.5"
    )
  }
  
  func testTrimZeroChars() throws {
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 1,
        characters: 0,
        startFromEnd: false,
        includeExtension: false
      ).rename(filename: "1234.567", context: context),
      "1234.567"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 1,
        characters: 0,
        startFromEnd: true,
        includeExtension: false
      ).rename(filename: "1234.567", context: context),
      "1234.567"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 1,
        characters: 0,
        startFromEnd: true,
        includeExtension: true
      ).rename(filename: "1234.567", context: context),
      "1234.567"
    )
  }
  
  func testTrimGreaterThanLength() throws {
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 20,
        characters: 1,
        startFromEnd: false,
        includeExtension: false
      ).rename(filename: "1234.567", context: context),
      "1234.567"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 20,
        characters: 1,
        startFromEnd: true,
        includeExtension: false
      ).rename(filename: "1234.567", context: context),
      "1234.567"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 20,
        characters: 1,
        startFromEnd: true,
        includeExtension: true
      ).rename(filename: "1234.567", context: context),
      "1234.567"
    )
  }
  
  func testTrimMoreThanChars() throws {
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 1,
        characters: 20,
        startFromEnd: false,
        includeExtension: false
      ).rename(filename: "1234.567", context: context),
      "1.567"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 1,
        characters: 20,
        startFromEnd: false,
        includeExtension: true
      ).rename(filename: "1234.567", context: context),
      "1"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 1,
        characters: 20,
        startFromEnd: true,
        includeExtension: false
      ).rename(filename: "1234.567", context: context),
      "4.567"
    )
    
    XCTAssertEqual(
      TrimBetweenFilenameRenamer(
        startIndex: 1,
        characters: 20,
        startFromEnd: true,
        includeExtension: true
      ).rename(filename: "1234.567", context: context),
      "7"
    )
  }
}
