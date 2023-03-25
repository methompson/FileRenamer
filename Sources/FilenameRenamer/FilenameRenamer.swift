protocol FilenameRenamer {
  var includeExtension: Bool { get }

  func rename(filename: String, context: RenameOpContext) -> String
//  func copy() -> FilenameRenamer
}

struct RenameOpContext {
  let count: Int
}

struct Filename {
  let name: String
  let fileExtension: String
}

class FilenameRenamerUtility {
  func separate(filename: String, includeExtension: Bool = false) -> Filename {
    // IncludeExtension means that we include the extension in the filename
    if (includeExtension) {
      return Filename(name: filename, fileExtension: "")
    }
    
    var vals = filename.split(separator: ".", omittingEmptySubsequences: false)
    if (vals.count < 2) {
      return Filename(name: filename, fileExtension: "")
    }
    
    let ext: String
    if let lastVal = vals.last {
      ext = String(lastVal)
    } else {
      ext = ""
    }
    
    vals.removeLast()
    let separateFilename = vals.joined(separator: ".")
    
    return Filename(name: separateFilename, fileExtension: ext)
  }
  
  func combine(name: String, fileExtension: String) -> String {
    if (fileExtension.count == 0) {
      return name
    }
    
    return name + "." + fileExtension
  }
}
