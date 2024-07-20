import Testing
@testable import TemperatureCalculations

@Test func initialValue() {
  let calculator = Calculator()
  #expect(calculator.value == 50.0)
}

@Test func initiallyFreezing() {
  let calculator = Calculator(value: 0)
  #expect(calculator.value == 0.0)
}
