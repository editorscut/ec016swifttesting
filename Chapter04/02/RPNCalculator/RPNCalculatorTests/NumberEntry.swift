import Testing
@testable import RPNCalculator

@MainActor
@Suite("Number Entry",
       .tags(Tag.display, Tag.numberEntry),
       .serialized)
struct NumberEntry {
  let current = CurrentValue.shared
  
  @Test("Display is initially empty")
  func t00emptyDisplay() {
    #expect(current.displayedValue.isEmpty == true)
  }
  
  @Test("Press 2 Display contains 2")
  func t01recordTwo() {
    current.record(digit: "2")
    #expect(current.displayedValue == "2")
  }
  
  @Test("Then Press 3 Display contains 23")
  func t02recordThree() {
    current.record(digit: "3")
    #expect(current.displayedValue == "23")
  }
  
  @Test("Then enter")
  func t03enter() {
    current.enter()
    #expect(current.displayedValue == "23")
    #expect(current.stackIsEmpty == false)
    #expect(current.displayingEnteredValue == true)
  }
}
