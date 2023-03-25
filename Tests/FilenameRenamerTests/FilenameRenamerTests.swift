//
//  File.swift
//  
//
//  Created by Mathew Thompson on 3/21/23.
//

import XCTest
@testable import FilenameRenamer

final class FilenameRenamerUtilityTests: XCTestCase {
  func testFilenameRenamerUtilityUnitTest() throws {
    let util = FilenameRenamerUtility()
    
    let test1 = util.separate(filename: "test.ext")
    XCTAssertEqual(test1.name, "test")
    XCTAssertEqual(test1.fileExtension, "ext")
    
    let test2 = util.separate(filename: "some.test.ext")
    XCTAssertEqual(test2.name, "some.test")
    XCTAssertEqual(test2.fileExtension, "ext")
    
    let test3 = util.separate(filename: "sometestext")
    XCTAssertEqual(test3.name, "sometestext")
    XCTAssertEqual(test3.fileExtension, "")
    
    let test4 = util.separate(filename: "")
    XCTAssertEqual(test4.name, "")
    XCTAssertEqual(test4.fileExtension, "")
  }
}
