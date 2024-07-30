import Testing
@testable import RPNCalculator

@MainActor
@Test("Display is initially empty",
      .tags(Tag.display))
func emptyDisplay() {
  let displayedValue = CurrentValue().displayedValue
  #expect(displayedValue.isEmpty == true)
}
