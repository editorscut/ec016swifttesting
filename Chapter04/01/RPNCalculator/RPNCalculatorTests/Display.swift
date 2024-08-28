import Testing
@testable import RPNCalculator

@MainActor
@Suite("Display logic",
       .tags(.display))
struct Display {
  let displayedValue = CurrentValue().displayedValue

  @Test("Display is initially empty")
  func emptyDisplay() {
    #expect(displayedValue.isEmpty == true)
  }
  
  @MainActor
  @Suite("Display's stack",
         .tags(.stacks))
  struct DisplayStack {
    var currentValue = CurrentValue()
    
    @Test("Stack is initially empty")
    func stackInitiallyEmpty() {
      #expect(currentValue.isStackEmpty == true)
    }
    
    @Test("Enter no value")
    func enterNoValue() {
      #expect(currentValue.isDisplayingEnteredValue == false)
      currentValue.enter()
      #expect(currentValue.isStackEmpty == true)
      #expect(currentValue.isDisplayingEnteredValue == false)
    }
    
    @Test("Enter displayedValue")
    func enterDisplayedValue() {
      currentValue.displayedValue = "5.7"
      currentValue.enter()
      #expect(currentValue.isStackEmpty == false)
    }
  }
}
