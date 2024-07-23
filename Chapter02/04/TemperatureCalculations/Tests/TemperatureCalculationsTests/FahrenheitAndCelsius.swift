import Testing
@testable import TemperatureCalculations

@Test func defaultValue() {
  let defaultTemperature = Temperature()
  #expect(defaultTemperature.inCelsius == 50.0)
}

@Test func freezingCreatedInCelsius() {
  let freezing = Temperature(inCelsius: 0)
  #expect(freezing.inCelsius == 0.0)
  #expect(freezing.inFahrenheit == 32.0)
}

@Test func convertBoilingToFahrenheit() {
  let boiling = Temperature(inCelsius: 100)
  #expect(boiling.inFahrenheit == 212.0)
}

@Test func createInFahrenheit() {
  let temperature = Temperature(inFahrenheit: 140)
  #expect(temperature.inCelsius == 60.0)
  #expect(temperature.inFahrenheit == 140.0)
}
