import Testing
@testable import RPNCalculator

struct StackTests {
  let emptyStack = Stack()
  let nonEmptyStack = Stack().push(10.3)
  
  @Test("A new stack is empty")
  func initiallyEmpty() {
    #expect(emptyStack.isEmpty == true)
  }
  
  @Test("A stack after push is not empty")
  func afterAPushNonEmptyStack() {
    let newStack = emptyStack.push(10.3)
    #expect(emptyStack.isEmpty == true)
    #expect(newStack.isEmpty == false)
  }
  
  @Test("A pop returns last element pushed")
  func popAfterPush() throws {
    let (poppedValue, newStack) = try nonEmptyStack.pop()
    #expect(newStack.isEmpty == true)
    #expect(poppedValue == 10.3)
  }
  
  @Test("Popping empty stack throws an error")
  func popEmptyStack() throws {
    #expect(throws: EmptyStack.self) {
      try emptyStack.pop()
    }
    #expect(emptyStack.isEmpty == true)
  }
  
  @Test("Avoid Popping empty stack")
  func dontPopEmptyStack() throws {
    try #require(throws: EmptyStack.self) {
      try emptyStack.pop()
    }
    #expect(emptyStack.isEmpty == true)
  }
  
  @Test("Can pop nonempty stack")
  func canPopNonemptyStack() throws {
    let (poppedValue, newStack) =
    try #require(try nonEmptyStack.pop())
    #expect(nonEmptyStack.isEmpty == false)
    #expect(newStack.isEmpty == true)
    #expect(poppedValue == 10.3)
  }
}
