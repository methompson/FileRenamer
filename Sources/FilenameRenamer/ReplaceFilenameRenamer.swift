//
//  ReplaceFilenameRenamer.swift
//  
//
//  Created by Mathew Thompson on 3/19/23.
//

import Foundation

class ReplaceFilenameRenamer: FilenameRenamerUtility, FilenameRenamer {
  let includeExtension: Bool
  
  let find: String
  let replace: String
  let findAll: Bool
  
  init(
    find: String,
    replace: String,
    findAll: Bool,
    includeExtension: Bool
  ) {
    self.find = find
    self.replace = replace
    self.findAll = findAll
    self.includeExtension = includeExtension
  }
  
  func rename(filename: String, context: RenameOpContext) -> String {
    let nameUtil = separate(filename: filename, includeExtension: includeExtension)
    
    let newName: String
    
    if (self.findAll) {
      newName = nameUtil.name.replacingOccurrences(of: self.find, with: self.replace)
    } else {
      if let range = nameUtil.name.range(of: self.find) {
        newName = nameUtil.name.replacingCharacters(in: range, with: self.replace)
      } else {
        newName = nameUtil.name
      }
    }
    
    return combine(name: newName, fileExtension: nameUtil.fileExtension)
  }
}
