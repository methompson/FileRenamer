//
//  FileRenamerCollection.swift
//  
//
//  Created by Mathew Thompson on 3/24/23.
//

import Foundation

class FileToBeRenamed: Identifiable {
  var id: String = UUID().uuidString
  let orignalName: String
  var newName: String
  
  init(originalName: String) {
    self.orignalName = originalName
    self.newName = originalName
  }
}

class FilenameRenamerCollection {
  let renamerOps: [FilenameRenamer]
  
  init(with renamerOps: [FilenameRenamer]) {
    self.renamerOps = renamerOps
  }
  
  func rename(files: [FileToBeRenamed]) {
    var count = 0
    
    for file in files {
      var newName = file.orignalName
      let context = RenameOpContext(count: count)
      
      for op in self.renamerOps {
        newName = op.rename(filename: newName, context: context)
      }
      
      file.newName = newName
      count += 1
    }
  }
}
