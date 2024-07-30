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
  
  func pop() throws -> (Double, Stack) {
    guard let last = contents.last else {
      throw EmptyStack()
    }
    return (last, Stack(contents.dropLast()))
  }
  
  var isEmpty: Bool {
    contents.isEmpty
  }
}
