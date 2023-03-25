//
//  CounterFilenameRenamerTests.swift
//  
//
//  Created by Mathew Thompson on 3/23/23.
//

import XCTest
@testable import FilenameRenamer

final class CounterFilenameRenamerTests: XCTestCase {
  func testCountInsertedAtIndex() throws {
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 0,
        withPaddedZeroes: 0,
        startFromEnd: false,
        includeExtension: false
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 0)
      ),
      "0filename.hello"
    )
    
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 6,
        withPaddedZeroes: 0,
        startFromEnd: false,
        includeExtension: false
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 0)
      ),
      "filena0me.hello"
    )
  }
  
  func testCountInsertedAtIndexFromEnd() throws {
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 0,
        withPaddedZeroes: 0,
        startFromEnd: true,
        includeExtension: true
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 0)
      ),
      "filename.hello0"
    )
    
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 0,
        withPaddedZeroes: 0,
        startFromEnd: true,
        includeExtension: false
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 0)
      ),
      "filename0.hello"
    )
    
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 3,
        withPaddedZeroes: 0,
        startFromEnd: true,
        includeExtension: true
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 0)
      ),
      "filename.he0llo"
    )
    
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 3,
        withPaddedZeroes: 0,
        startFromEnd: true,
        includeExtension: false
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 0)
      ),
      "filen0ame.hello"
    )
  }
  
  func testCountInsertedWithPadding() throws {
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 0,
        withPaddedZeroes: 5,
        startFromEnd: false,
        includeExtension: true
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 1)
      ),
      "00001filename.hello"
    )
    
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 0,
        withPaddedZeroes: 5,
        startFromEnd: false,
        includeExtension: true
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 10)
      ),
      "00010filename.hello"
    )
    
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 0,
        withPaddedZeroes: 5,
        startFromEnd: false,
        includeExtension: true
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 100)
      ),
      "00100filename.hello"
    )
    
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 0,
        withPaddedZeroes: 5,
        startFromEnd: false,
        includeExtension: true
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 1000)
      ),
      "01000filename.hello"
    )
    
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 0,
        at: 0,
        withPaddedZeroes: 5,
        startFromEnd: false,
        includeExtension: true
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 10000)
      ),
      "10000filename.hello"
    )
  }
  
  func testCountInsertedGreaterThanPadding() throws {
    XCTAssertEqual(
      CounterFilenameRenamer(
        startingNumber: 1000,
        at: 0,
        withPaddedZeroes: 2,
        startFromEnd: false,
        includeExtension: true
      ).rename(
        filename: "filename.hello",
        context: RenameOpContext(count: 0)
      ),
      "1000filename.hello"
    )
  }
}
