import Testing
@testable import RPNCalculator

@MainActor
@Test("Display is initially empty",
      .tags(.display))
func emptyDisplay() {
  let displayedValue = CurrentValue().displayedValue
  #expect(displayedValue.isEmpty == true)
}
