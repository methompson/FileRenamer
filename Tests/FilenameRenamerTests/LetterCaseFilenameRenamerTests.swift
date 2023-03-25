//
//  LetterCaseFilenameRenamerTests.swift
//  
//
//  Created by Mathew Thompson on 3/22/23.
//

import XCTest
@testable import FilenameRenamer

final class LetterCaseFilenameRenamerTests: XCTestCase {
  let context = RenameOpContext(count: 0)
  
  func testUpperCase() throws {
    XCTAssertEqual(
      LetterCaseFilenameRenamer(
        letterCase: LetterCase.uppercase,
        includeExtension: false
      ).rename(
        filename: "test.hello",
        context: context
      ),
      "TEST.hello"
    )
    
    XCTAssertEqual(
      LetterCaseFilenameRenamer(
        letterCase: LetterCase.uppercase,
        includeExtension: true
      ).rename(
        filename: "test.hello",
        context: context
      ),
      "TEST.HELLO"
    )
  }
  
  func testLowerCase() throws {
    XCTAssertEqual(
      LetterCaseFilenameRenamer(
        letterCase: LetterCase.lowercase,
        includeExtension: false
      ).rename(
        filename: "Test.Hello",
        context: context
      ),
      "test.Hello"
    )
    
    XCTAssertEqual(
      LetterCaseFilenameRenamer(
        letterCase: LetterCase.lowercase,
        includeExtension: true
      ).rename(
        filename: "Test.Hello",
        context: context
      ),
      "test.hello"
    )
  }
  
  func testCapsCase() throws {
    XCTAssertEqual(
      LetterCaseFilenameRenamer(
        letterCase: LetterCase.capscase,
        includeExtension: false
      ).rename(
        filename: "test.hello",
        context: context
      ),
      "Test.hello"
    )
    
    XCTAssertEqual(
      LetterCaseFilenameRenamer(
        letterCase: LetterCase.capscase,
        includeExtension: false
      ).rename(
        filename: "a bunch of extra words in a file name.hello there",
        context: context
      ),
      "A Bunch Of Extra Words In A File Name.hello there"
    )
    
    XCTAssertEqual(
      LetterCaseFilenameRenamer(
        letterCase: LetterCase.capscase,
        includeExtension: true
      ).rename(
        filename: "test.hello",
        context: context
      ),
      "Test.Hello"
    )
    
    XCTAssertEqual(
      LetterCaseFilenameRenamer(
        letterCase: LetterCase.capscase,
        includeExtension: true
      ).rename(
        filename: "a bunch of extra words in a file name.hello there",
        context: context
      ),
      "A Bunch Of Extra Words In A File Name.Hello There"
    )
  }
}
