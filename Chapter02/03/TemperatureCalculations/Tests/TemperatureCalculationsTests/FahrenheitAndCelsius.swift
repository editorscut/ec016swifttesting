import Testing
@testable import TemperatureCalculations

@Test func initialValue() {
  let temperature = Temperature()
  #expect(temperature.inCelsius == 50.0)
}

@Test func initiallyFreezing() {
  let temperature = Temperature(inCelsius: 0)
  #expect(temperature.inCelsius == 0.0)
}

@Test func convertFreezingToFahrenheit() {
  let temperature = Temperature(inCelsius: 0)
  #expect(temperature.inFahrenheit == 32.0)
}

@Test func convertBoilingToFahrenheit() {
  let temperature = Temperature(inCelsius: 100)
  #expect(temperature.inFahrenheit == 212.0)
}

