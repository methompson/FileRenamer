//
//  TrimBetweenFilenameRenamer.swift
//
//
//  Created by Mathew Thompson on 3/19/23.
//

class TrimBetweenFilenameRenamer: FilenameRenamerUtility, FilenameRenamer {
  let includeExtension: Bool
  
  let startFromEnd: Bool
  let startIndex: UInt16
  let characters: UInt16
  
  init(
    startIndex: UInt16,
    characters: UInt16,
    startFromEnd: Bool,
    includeExtension: Bool
  ) {
    self.startIndex = startIndex
    self.characters = characters
    self.startFromEnd = startFromEnd
    self.includeExtension = includeExtension
  }
  
  func rename(filename: String, context: RenameOpContext) -> String {
    let nameUtil = separate(filename: filename, includeExtension: includeExtension)
       
    if (self.startIndex >= nameUtil.name.count) {
      return filename
    }
    
    if (self.startFromEnd) {
      return renameEndToBeginning(filename: nameUtil)
    }
    return renameBeginningToEnd(filename: nameUtil)
  }
  
  func renameEndToBeginning(filename: Filename) -> String {
    let endPoint = filename.name.count - Int(self.startIndex)
    var startPoint = endPoint - Int(self.characters)
    if (startPoint < 0) {
      startPoint = 0
    }
    
    var newName = filename.name
    
    let startIndex = newName.index(newName.startIndex, offsetBy: startPoint)
    let endIndex = newName.index(newName.startIndex, offsetBy: endPoint)
    let range = startIndex ..< endIndex
    
    newName.removeSubrange(range)
    return combine(name: newName, fileExtension: filename.fileExtension)
  }
  
  func renameBeginningToEnd(filename: Filename) -> String {
    let startPoint = Int(self.startIndex)
    var endPoint = startPoint + Int(self.characters)
    
    if (endPoint > filename.name.count) {
      endPoint = filename.name.count
    }
    
    var newName = filename.name
    
    let startIndex = newName.index(newName.startIndex, offsetBy: startPoint)
    let endIndex = newName.index(newName.startIndex, offsetBy: endPoint)
    let range = startIndex ..< endIndex
    
    newName.removeSubrange(range)
    return combine(name: newName, fileExtension: filename.fileExtension)
  }
}
