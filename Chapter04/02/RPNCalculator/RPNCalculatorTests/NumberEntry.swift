import Testing
@testable import RPNCalculator

@MainActor
@Suite("Number Entry",
       .tags(.display, .numberEntry),
       .serialized)
struct NumberEntry {
  let current = CurrentValue.shared
  
  @Test("Display is initially empty")
  func emptyDisplay() {
    #expect(current.displayedValue.isEmpty == true)
  }
  
  @Test("Press 2 Display contains 2")
  func recordTwo() {
    current.record(digit: "2")
    #expect(current.displayedValue == "2")
  }
  
  @Test("Then Press 3 Display contains 23")
  func recordThree() {
    current.record(digit: "3")
    #expect(current.displayedValue == "23")
  }
  
  @Test("Then enter")
  func enter() {
    current.enter()
    #expect(current.displayedValue == "23")
    #expect(current.isStackEmpty == false)
    #expect(current.isDisplayingEnteredValue == true)
  }
  
  @Test("Press 4 after enter display contains 4")
  func recordFour() {
    current.record(digit: "4")
    #expect(current.displayedValue == "4")
    #expect(current.isDisplayingEnteredValue == false)
  }
  
  @Test("Press drop display contains 23")
  func drop() {
    current.drop()
    #expect(current.displayedValue == "23.0")
    #expect(current.isDisplayingEnteredValue == true)
    #expect(current.isStackEmpty == true)
  }
  
  @Test("Can enter and drop negative")
  func negative() {
    current.displayedValue = "-7.8"
    current.enter()
    current.drop()
    #expect(current.displayedValue == "-7.8")
  }
}
