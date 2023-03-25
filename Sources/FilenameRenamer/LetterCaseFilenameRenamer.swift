//
//  LetterCaseFilenameRenamer.swift
//  
//
//  Created by Mathew Thompson on 3/22/23.
//

enum LetterCase {
  case uppercase
  case lowercase
  case capscase
}

class LetterCaseFilenameRenamer: FilenameRenamerUtility, FilenameRenamer {
  let includeExtension: Bool
  
  let letterCase: LetterCase
  
  init(
    letterCase: LetterCase,
    includeExtension: Bool
  ) {
    self.letterCase = letterCase
    self.includeExtension = includeExtension
  }
  
  func rename(filename: String, context: RenameOpContext) -> String {
    let nameUtil = separate(filename: filename, includeExtension: includeExtension)
    
    let newName: String
    
    switch self.letterCase {
    case .uppercase:
      newName = nameUtil.name.uppercased()
      break
      
    case .lowercase:
      newName = nameUtil.name.lowercased()
      break
      
    case.capscase:
      newName = nameUtil.name.capitalized
      break
      
    }
    
    return combine(name: newName, fileExtension: nameUtil.fileExtension)
  }
}
