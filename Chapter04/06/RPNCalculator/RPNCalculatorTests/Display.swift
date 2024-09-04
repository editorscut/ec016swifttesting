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
    let currentValue = CurrentValue()
    
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
    
    @Test("Enter 23 then drop")
    func enterThenDrop() {
      currentValue.displayedValue = "23"
      currentValue.enter()
      #expect(currentValue.displayedValue == "23")
      #expect(currentValue.isStackEmpty == false)
      #expect(currentValue.isDisplayingEnteredValue == true)

      currentValue.drop()
      #expect(currentValue.displayedValue == "23.0")
      #expect(currentValue.isDisplayingEnteredValue == true)
      #expect(currentValue.isStackEmpty == true)
    }
    
    @Test("Fill and clear the stack")
    func enterThenClear() {
      currentValue.displayedValue = "23"
      currentValue.enter()
      currentValue.displayedValue = "45"
      currentValue.enter()
      #expect(currentValue.displayedValue == "45")
      #expect(currentValue.isStackEmpty == false)
      
      currentValue.clear()
      #expect(currentValue.displayedValue == "")
      #expect(currentValue.isDisplayingEnteredValue == false)
      #expect(currentValue.isStackEmpty == true)
    }
  }
}
