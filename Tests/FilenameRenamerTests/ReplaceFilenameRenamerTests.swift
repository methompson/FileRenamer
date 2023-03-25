//
//  ReplaceFilenameRenamer.swift
//  
//
//  Created by Mathew Thompson on 3/22/23.
//

import XCTest
@testable import FilenameRenamer

final class ReplaceFilenameRenamerTests: XCTestCase {
  let context = RenameOpContext(count: 0)
  
  func testReplacesAllInstances() throws {
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "test",
        replace: "foo",
        findAll: true,
        includeExtension: false
      ).rename(
        filename: "test.hello",
        context: context
      ),
      "foo.hello"
    )
    
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "test",
        replace: "foo",
        findAll: true,
        includeExtension: false
      ).rename(
        filename: "testtest.hello",
        context: context
      ),
      "foofoo.hello"
    )
    
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "test",
        replace: "foo",
        findAll: true,
        includeExtension: false
      ).rename(
        filename: "test_morewords_and another test.hello",
        context: context
      ),
      "foo_morewords_and another foo.hello"
    )
  }
  
  func testReplacesFirstInstance() {
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "test",
        replace: "foo",
        findAll: false,
        includeExtension: false
      ).rename(
        filename: "test.hello",
        context: context
      ),
      "foo.hello"
    )
    
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "test",
        replace: "foo",
        findAll: false,
        includeExtension: false
      ).rename(
        filename: "testtest.hello",
        context: context
      ),
      "footest.hello"
    )
    
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "test",
        replace: "foo",
        findAll: false,
        includeExtension: false
      ).rename(
        filename: "test_morewords_and another test.hello",
        context: context
      ),
      "foo_morewords_and another test.hello"
    )
  }
  
  func testSkipsExtensions() {
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "hello",
        replace: "foo",
        findAll: true,
        includeExtension: false
      ).rename(
        filename: "test.hello",
        context: context
      ),
      "test.hello"
    )
    
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "hello",
        replace: "foo",
        findAll: true,
        includeExtension: false
      ).rename(
        filename: "hello_test.hello",
        context: context
      ),
      "foo_test.hello"
    )
    
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "hello",
        replace: "foo",
        findAll: true,
        includeExtension: false
      ).rename(
        filename: "hello_morewords_and another hello.hello",
        context: context
      ),
      "foo_morewords_and another foo.hello"
    )
  }
  
  func testIncludesExtensions() {
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "hello",
        replace: "foo",
        findAll: true,
        includeExtension: true
      ).rename(
        filename: "test.hello",
        context: context
      ),
      "test.foo"
    )
    
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "hello",
        replace: "foo",
        findAll: true,
        includeExtension: true
      ).rename(
        filename: "hello_test.hello",
        context: context
      ),
      "foo_test.foo"
    )
    
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "hello",
        replace: "foo",
        findAll: true,
        includeExtension: true
      ).rename(
        filename: "hello_morewords_and another hello.hello",
        context: context
      ),
      "foo_morewords_and another foo.foo"
    )
  }
  
  func testIncludesExtensionsAndRespectsFindAll() {
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "hello",
        replace: "foo",
        findAll: false,
        includeExtension: true
      ).rename(
        filename: "test.hello",
        context: context
      ),
      "test.foo"
    )
    
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "hello",
        replace: "foo",
        findAll: false,
        includeExtension: true
      ).rename(
        filename: "hello_test.hello",
        context: context
      ),
      "foo_test.hello"
    )
    
    XCTAssertEqual(
      ReplaceFilenameRenamer(
        find: "hello",
        replace: "foo",
        findAll: false,
        includeExtension: true
      ).rename(
        filename: "hello_morewords_and another hello.hello",
        context: context
      ),
      "foo_morewords_and another hello.hello"
    )
  }
}
