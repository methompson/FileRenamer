//
//  FilenameRenamerCollectionTests.swift
//  
//
//  Created by Mathew Thompson on 3/24/23.
//

import XCTest
@testable import FilenameRenamer

final class FilenameRenamerCollectionTests: XCTestCase {
  let file1 = FileToBeRenamed(originalName: "show_some_name.mp4")
  let file2 = FileToBeRenamed(originalName: "show_some_other_name.mp4")
  let file3 = FileToBeRenamed(originalName: "show_another_name.mp4")
  let file4 = FileToBeRenamed(originalName: "show_omg_that's_weird.mp4")
  
  func testRenameWithMultipleOps() throws {
    let trimOp = TrimStartFilenameRenamer(characters: 4, includeExtension: false)
    let countOp = CounterFilenameRenamer(
      startingNumber: 1,
      at: 0,
      withPaddedZeroes: 2,
      startFromEnd: false,
      includeExtension: false
    )
    let replaceOp = ReplaceFilenameRenamer(
      find: "_",
      replace: " ",
      findAll: true,
      includeExtension: false
    )
    
    let collection = FilenameRenamerCollection(with: [
      trimOp,
      countOp,
      replaceOp,
    ])
    
    collection.rename(files: [
      file1,
      file2,
      file3,
      file4
    ])
    
    XCTAssertEqual(file1.newName, "01 some name.mp4")
    XCTAssertEqual(file2.newName, "02 some other name.mp4")
    XCTAssertEqual(file3.newName, "03 another name.mp4")
    XCTAssertEqual(file4.newName, "04 omg that's weird.mp4")
  }
  
  func testRenameCounterTrimWhole() throws {
    let trimOp = TrimStartFilenameRenamer(characters: 40, includeExtension: false)
    let countOp = CounterFilenameRenamer(
      startingNumber: 1,
      at: 0,
      withPaddedZeroes: 2,
      startFromEnd: false,
      includeExtension: false
    )
    
    let collection = FilenameRenamerCollection(with: [
      trimOp,
      countOp,
    ])
    
    collection.rename(files: [
      file1,
      file2,
      file3,
      file4
    ])
    
    XCTAssertEqual(file1.newName, "01.mp4")
    XCTAssertEqual(file2.newName, "02.mp4")
    XCTAssertEqual(file3.newName, "03.mp4")
    XCTAssertEqual(file4.newName, "04.mp4")
  }
}
