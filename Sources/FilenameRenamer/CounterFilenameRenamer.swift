//
//  File.swift
//  
//
//  Created by Mathew Thompson on 3/21/23.
//

class CounterFilenameRenamer: InsertFilenameRenamerBase {
  let startingNumber: Int
  let index: UInt16
  let withPaddedZeroes: UInt16
  let startFromEnd: Bool
  
  init(
    startingNumber: Int,
    at index: UInt16,
    withPaddedZeroes: UInt16,
    startFromEnd: Bool,
    includeExtension: Bool
  ) {
    self.startingNumber = startingNumber
    self.index = index
    self.withPaddedZeroes = withPaddedZeroes
    self.startFromEnd = startFromEnd
    
    super.init(includeExtension: includeExtension)
  }
  
  override func rename(filename: String, context: RenameOpContext) -> String {
    let nameUtil = separate(filename: filename, includeExtension: includeExtension)
    
    let currentCount = String(context.count + self.startingNumber)
    
    let paddingLength = Int(withPaddedZeroes) - currentCount.count
    
    let padding: String
    if (paddingLength > 0) {
      padding = String("")
        .padding(
          toLength: paddingLength,
          withPad: "0",
          startingAt: 0
        )
    } else {
      padding = ""
    }
    
    let chars = padding + currentCount
    
    let newName = insert(
      chars: chars,
      into: nameUtil.name,
      at: self.index,
      startFromEnd: self.startFromEnd
    )
    
    return combine(name: newName, fileExtension: nameUtil.fileExtension)
  }
}

