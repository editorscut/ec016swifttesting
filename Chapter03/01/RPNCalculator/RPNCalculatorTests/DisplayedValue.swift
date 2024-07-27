import Testing
@testable import RPNCalculator


@MainActor
@Test func initiallyEmpty()  {
  let currentValue = CurrentValue()
  #expect(currentValue.displayedValue == "")
}

