import Testing
@testable import RPNCalculator


@Test("A new stack is empty")
func initiallyEmpty() {
  let stack = Stack()
  #expect(stack.isEmpty == true)
}

@Test("A stack after push is not empty")
func afterAPushNonEmptyStack() {
  let stack = Stack()
  let newStack = stack.push(10.3)
  #expect(stack.isEmpty == true)
  #expect(newStack.isEmpty == false)
}

@Test("A pop returns last element pushed")
func popAfterPush() throws {
  let stack = Stack()
  let (poppedValue, newStack) = try stack.push(10.3).pop()
  #expect(newStack.isEmpty == true)
  #expect(poppedValue == 10.3)
}

@Test("Popping empty stack throws an error")
func popEmptyStack()  {
  let stack = Stack()
  #expect(throws: EmptyStack.self) {
     try stack.pop()
  }
  #expect(stack.isEmpty == true)
}

@Test("Avoid Popping empty stack")
func dontPopEmptyStack() throws {
  let stack = Stack()
  try #require(throws: EmptyStack.self) {
    try stack.pop()
  }
  #expect(stack.isEmpty == true)
}

@Test("Can pop nonempty stack")
func canPopNonemptyStack() throws {
  let stack = Stack().push(10.3)
  let (poppedValue, newStack) =
  try #require(try stack.pop())
  #expect(stack.isEmpty == false)
  #expect(newStack.isEmpty == true)
  #expect(poppedValue == 10.3)
}
