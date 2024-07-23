import Testing
@testable import TemperatureCalculations

@Test("By default a new Temperature is 50º C")
func defaultValue() {
  let defaultTemperature = Temperature()
  #expect(defaultTemperature.inCelsius == 50.0)
}

@Test("0º C should be 0º C and 32º F",
      .tags(Tag.createFromC, Tag.convertCtoF))
func freezing() {
  let freezing = Temperature(inCelsius: 0)
  #expect(freezing.inCelsius == 0.0)
  #expect(freezing.inFahrenheit == 32.0)
}

@Test("100º C should be 212º F",
      .tags(Tag.createFromC, Tag.convertCtoF))
func boiling() {
  let boiling = Temperature(inCelsius: 100)
  #expect(boiling.inFahrenheit == 212.0)
}

@Test("New Temperature in ºF",
      .tags(Tag.createFromF, Tag.convertCtoF,
            Tag.convertFtoC))
func createInFahrenheit() {
  let temperature = Temperature(inFahrenheit: 140)
  #expect(temperature.inCelsius == 60.0)
  #expect(temperature.inFahrenheit == 140.0)
}
