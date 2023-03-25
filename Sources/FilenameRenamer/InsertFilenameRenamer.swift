//
//  File.swift
//  
//
//  Created by Mathew Thompson on 3/21/23.
//

class InsertFilenameRenamerBase: FilenameRenamerUtility, FilenameRenamer {
  let includeExtension: Bool
  
  init(
    includeExtension: Bool
  ) {
    self.includeExtension = includeExtension
  }
  
  func rename(filename: String, context: RenameOpContext) -> String {
    fatalError("Unimplemented")
  }

  func insert(
    chars: String,
    into name: String,
    at index: UInt16,
    startFromEnd: Bool
  ) -> String {
    var newName = name
    let insertIndex: String.Index
    
    if (index > newName.count) {
      insertIndex = startFromEnd
      ? newName.startIndex
      : newName.endIndex
    } else if (startFromEnd) {
      insertIndex = newName.index(newName.endIndex, offsetBy: -1 * Int(index))
    } else {
      insertIndex = newName.index(newName.startIndex, offsetBy: Int(index))
    }
    
    newName.insert(contentsOf: chars, at: insertIndex)
    
    return newName
  }
}

class InsertFilenameRenamer: InsertFilenameRenamerBase {
  let characters: String
  let index: UInt16
  let startFromEnd: Bool
  
  init(
    characters: String,
    at index: UInt16,
    startFromEnd: Bool,
    includeExtension: Bool
  ) {
    self.characters = characters
    self.index = index
    self.startFromEnd = startFromEnd
    
    super.init(includeExtension: includeExtension)
  }
  
  override func rename(filename: String, context: RenameOpContext) -> String {
    let nameUtil = separate(filename: filename, includeExtension: includeExtension)
    
    let newName = insert(
      chars: self.characters,
      into: nameUtil.name,
      at: self.index,
      startFromEnd: self.startFromEnd
    )

    return combine(name: newName, fileExtension: nameUtil.fileExtension)
  }
}
