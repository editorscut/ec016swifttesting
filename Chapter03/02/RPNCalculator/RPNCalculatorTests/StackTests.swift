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
