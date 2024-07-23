struct Temperature {
  let inCelsius: Double

  init(inCelsius: Double = 50) {
    self.inCelsius = inCelsius
  }
}

extension Temperature {
  var inFahrenheit: Double {
    inCelsius * 9/5 + 32.0
  }
}
