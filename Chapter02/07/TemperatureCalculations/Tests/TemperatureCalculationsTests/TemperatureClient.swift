import Testing
import TemperatureCalculations


@Test("Display 50º C (122º C)",
      .tags(Tag.displayAsString))
func defaultValueDisplay() {
  let defaultTemp = Temperature()
  #expect(defaultTemp.descriptionInC == "50º C")
  #expect(defaultTemp.descriptionInF == "122º F")
  #expect("\(defaultTemp)" == "50º C (122º F)")
}


@Test("Display 75.7º C (168º F)",
      .tags(Tag.displayAsString))
func nontIntDisplay() {
  let nonIntTemp = Temperature(inCelsius: 75.7)
  #expect(nonIntTemp.descriptionInC == "76º C")
  #expect(nonIntTemp.descriptionInF == "168º F")
  #expect("\(nonIntTemp)" == "76º C (168º F)")
}
