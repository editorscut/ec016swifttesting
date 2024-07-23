struct Temperature {
  let inCelsius: Double
  
  init() {
    inCelsius = 50
  }
  
  init(inCelsius: Double) {
    self.inCelsius = inCelsius
  }
  
  init(inFahrenheit: Double) {
    self.inCelsius = (inFahrenheit - 32.0) * 5/9
  }
}

extension Temperature {
  var inFahrenheit: Double {
    inCelsius * 9/5 + 32.0
  }
}
