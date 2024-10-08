import Testing
import TemperatureCalculations


@Test("Display 50° C (122° C)",
      .tags(Tag.displayAsString))
func defaultValueDisplay() {
  let defaultTemp = Temperature()
  #expect(defaultTemp.descriptionInC == "50° C")
  #expect(defaultTemp.descriptionInF == "122° F")
  #expect("\(defaultTemp)" == "50° C (122° F)")
}


@Test("Display 75.7° C (168° F)",
      .tags(Tag.displayAsString))
func nontIntDisplay() {
  let nonIntTemp = Temperature(inCelsius: 75.7)
  #expect(nonIntTemp.descriptionInC == "76° C")
  #expect(nonIntTemp.descriptionInF == "168° F")
  #expect("\(nonIntTemp)" == "76° C (168° F)")
}

@Test("Can change temperature from 0° C to 40° C")
func changingTemp() {
  let freezing = Temperature(inCelsius: 0)
  freezing.inCelsius += 40.0
  #expect(freezing.descriptionInC == "40° C")
}
