//
//  TrimEndFileNameRenamer.swift
//  
//
//  Created by Mathew Thompson on 3/19/23.
//

class TrimEndFilenameRenamer: FilenameRenamerUtility, FilenameRenamer {
  let includeExtension: Bool
  let characters: UInt16
  
  init(
    characters: UInt16,
    includeExtension: Bool
  ) {
    self.characters = characters
    self.includeExtension = includeExtension
  }
  
  func rename(filename: String, context: RenameOpContext) -> String {
    let nameUtil = separate(filename: filename, includeExtension: self.includeExtension)
    
    if (self.characters >= nameUtil.name.count) {
      return combine(name: "", fileExtension: nameUtil.fileExtension)
    }
    
    let chars: Int = Int(characters)
    
    var newName = nameUtil.name

    let range = newName.index(newName.endIndex, offsetBy: chars * -1)..<newName.endIndex
    newName.removeSubrange(range)
    
    return combine(name: newName, fileExtension: nameUtil.fileExtension)
  }
}
