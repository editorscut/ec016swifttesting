import Testing
@testable import RPNCalculator

@MainActor
@Test("Display is initially empty")
func emptyDisplay() {
  let displayedValue = CurrentValue().displayedValue
  #expect(displayedValue.isEmpty == true)
}
