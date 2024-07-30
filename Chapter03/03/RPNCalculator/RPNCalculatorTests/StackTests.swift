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
func popEmptyStack() throws {
  let stack = Stack()
  let (_, newStack) = try stack.pop()
  #expect(newStack.isEmpty == true)
}

