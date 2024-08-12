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
      #expect(currentValue.stackIsEmpty == true)
    }
    
    @Test("Enter no value")
    func enterNoValue() {
      #expect(currentValue.displayingEnteredValue == false)
      currentValue.enter()
      #expect(currentValue.stackIsEmpty == true)
      #expect(currentValue.displayingEnteredValue == false)
    }
    
    @Test("Enter displayedValue")
    func enterDisplayedValue() {
      currentValue.displayedValue = "5.7"
      currentValue.enter()
      #expect(currentValue.stackIsEmpty == false)
    }
    
    @Test("Enter 23 then drop")
    func enterThenDrop() {
      currentValue.displayedValue = "23"
      currentValue.enter()
      #expect(currentValue.displayedValue == "23")
      #expect(currentValue.stackIsEmpty == false)
      #expect(currentValue.displayingEnteredValue == true)

      currentValue.drop()
      #expect(currentValue.displayedValue == "23.0")
      #expect(currentValue.displayingEnteredValue == true)
      #expect(currentValue.stackIsEmpty == true)
    }
    
    @Test("Fill and clear the stack")
    func enterThenClear() {
      currentValue.displayedValue = "23"
      currentValue.enter()
      currentValue.displayedValue = "45"
      currentValue.enter()
      #expect(currentValue.displayedValue == "45")
      #expect(currentValue.stackIsEmpty == false)
      
      currentValue.clear()
      #expect(currentValue.displayedValue == "")
      #expect(currentValue.displayingEnteredValue == false)
      #expect(currentValue.stackIsEmpty == true)
    }
  }
}
