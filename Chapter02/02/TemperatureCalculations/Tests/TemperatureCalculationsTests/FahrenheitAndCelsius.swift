import Testing
@testable import TemperatureCalculations

@Test func initialValue() {
  let temperature = Temperature()
  #expect(temperature.value == 50.0)
}

@Test func initiallyFreezing() {
  let temperature = Temperature(value: 0)
  #expect(temperature.value == 0.0)
}
