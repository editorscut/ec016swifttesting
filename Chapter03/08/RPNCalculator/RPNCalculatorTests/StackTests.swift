import Testing
@testable import RPNCalculator

@Suite("Stack tests for create, push, and pop",
       .tags(.stacks))
struct StackTests {
  let emptyStack = Stack()
  let nonEmptyStack = Stack().push(10.3)
  
  @Test("A new stack is empty")
  func initiallyEmpty() {
    #expect(emptyStack.isEmpty == true)
  }
  
  @Test("A stack after push is not empty",
        .tags(.push))
  func afterAPushNonEmptyStack() {
    let newStack = emptyStack.push(10.3)
    #expect(emptyStack.isEmpty == true)
    #expect(newStack.isEmpty == false)
  }
  
  @Test("Can clear stack")
  func clearStack() {
    #expect(emptyStack.clear().isEmpty == true)
    #expect(nonEmptyStack.clear().isEmpty == true)
  }
  
  @Test("A pop returns last element pushed",
        .tags(.pop))
  func popAfterPush() throws {
    let (poppedValue, newStack) = try nonEmptyStack.pop()
    #expect(newStack.isEmpty == true)
    #expect(poppedValue == 10.3)
  }
  
  @Test("Popping empty stack throws an error",
        .tags(.pop))
  func popEmptyStack() {
    #expect(throws: EmptyStack.self) {
      try emptyStack.pop()
    }
    #expect(emptyStack.isEmpty == true)
  }
  
  @Test("Avoid Popping empty stack",
        .tags(.pop))
  func dontPopEmptyStack() throws {
    try #require(throws: EmptyStack.self) {
      try emptyStack.pop()
    }
    #expect(emptyStack.isEmpty == true)
  }
  
  @Test("Can pop nonempty stack",
        .tags(.pop))
  func canPopNonemptyStack() throws {
    let (poppedValue, newStack) =
    try #require(try nonEmptyStack.pop())
    #expect(nonEmptyStack.isEmpty == false)
    #expect(newStack.isEmpty == true)
    #expect(poppedValue == 10.3)
  }
}
