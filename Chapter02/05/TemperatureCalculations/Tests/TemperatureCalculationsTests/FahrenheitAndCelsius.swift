import Testing
@testable import TemperatureCalculations

@Test("By default a new Temperature is 50° C")
func defaultValue() {
  let defaultTemperature = Temperature()
  #expect(defaultTemperature.inCelsius == 50.0)
}

@Test("0° C should be 0° C and 32° F")
func freezing() {
  let freezing = Temperature(inCelsius: 0)
  #expect(freezing.inCelsius == 0.0)
  #expect(freezing.inFahrenheit == 32.0)
}

@Test("100° C should be 212° F")
func boiling() {
  let boiling = Temperature(inCelsius: 100)
  #expect(boiling.inFahrenheit == 212.0)
}

@Test("New Temperature in °F")
func createInFahrenheit() {
  let temperature = Temperature(inFahrenheit: 140)
  #expect(temperature.inCelsius == 60.0)
  #expect(temperature.inFahrenheit == 140.0)
}
