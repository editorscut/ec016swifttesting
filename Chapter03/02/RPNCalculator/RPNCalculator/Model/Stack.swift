struct Stack {
  private let contents: [Double]
  
  init() {
    contents = []
  }
  
  private init(_ contents: [Double]) {
    self.contents = contents
  }
}

extension Stack {
  func push(_ numberToPush: Double) -> Stack {
    Stack(contents + [numberToPush])
  }
  
  var isEmpty: Bool {
    contents.isEmpty
  }
}
