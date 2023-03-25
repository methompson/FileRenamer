//
//  InsertFilenameRenamerTests.swift
//  
//
//  Created by Mathew Thompson on 3/23/23.
//

import XCTest
@testable import FilenameRenamer

final class InsertFilenameRenamerTests: XCTestCase {
  let context = RenameOpContext(count: 0)
  
  func testInsertCharacters() throws {
    XCTAssertEqual(
      InsertFilenameRenamer(
        characters: "Bar",
        at: 0,
        startFromEnd: false,
        includeExtension: false
      ).rename(
        filename: "fooBaz.hello",
        context: context
      ),
      "BarfooBaz.hello"
    )
    
    XCTAssertEqual(
      InsertFilenameRenamer(
        characters: "Bar",
        at: 3,
        startFromEnd: false,
        includeExtension: false
      ).rename(
        filename: "fooBaz.hello",
        context: context
      ),
      "fooBarBaz.hello"
    )
    
    XCTAssertEqual(
      InsertFilenameRenamer(
        characters: "Bar",
        at: 8,
        startFromEnd: false,
        includeExtension: true
      ).rename(
        filename: "fooBaz.hello",
        context: context
      ),
      "fooBaz.hBarello"
    )
  }
  
  func testInsertCharactersAtRear() throws {
    XCTAssertEqual(
      InsertFilenameRenamer(
        characters: "Bar",
        at: 0,
        startFromEnd: true,
        includeExtension: false
      ).rename(
        filename: "fooBaz.hello",
        context: context
      ),
      "fooBazBar.hello"
    )
    
    XCTAssertEqual(
      InsertFilenameRenamer(
        characters: "Bar",
        at: 3,
        startFromEnd: true,
        includeExtension: false
      ).rename(
        filename: "fooBaz.hello",
        context: context
      ),
      "fooBarBaz.hello"
    )
    
    XCTAssertEqual(
      InsertFilenameRenamer(
        characters: "Bar",
        at: 0,
        startFromEnd: true,
        includeExtension: true
      ).rename(
        filename: "fooBaz.hello",
        context: context
      ),
      "fooBaz.helloBar"
    )
  }
  
  func testInsertCharactersPastLength() throws {
    XCTAssertEqual(
      InsertFilenameRenamer(
        characters: "Bar",
        at: 20,
        startFromEnd: false,
        includeExtension: false
      ).rename(
        filename: "fooBaz.hello",
        context: context
      ),
      "fooBazBar.hello"
    )
    
    XCTAssertEqual(
      InsertFilenameRenamer(
        characters: "Bar",
        at: 20,
        startFromEnd: false,
        includeExtension: true
      ).rename(
        filename: "fooBaz.hello",
        context: context
      ),
      "fooBaz.helloBar"
    )
    
    XCTAssertEqual(
      InsertFilenameRenamer(
        characters: "Bar",
        at: 20,
        startFromEnd: true,
        includeExtension: false
      ).rename(
        filename: "fooBaz.hello",
        context: context
      ),
      "BarfooBaz.hello"
    )
    
    XCTAssertEqual(
      InsertFilenameRenamer(
        characters: "Bar",
        at: 20,
        startFromEnd: true,
        includeExtension: true
      ).rename(
        filename: "fooBaz.hello",
        context: context
      ),
      "BarfooBaz.hello"
    )
  }
  
  
}
