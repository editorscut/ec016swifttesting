public struct Temperature {
  let inCelsius: Double
  
  public init() {
    inCelsius = 50
  }
  
  public init(inCelsius: Double) {
    self.inCelsius = inCelsius
  }
  
  public init(inFahrenheit: Double) {
    self.inCelsius = (inFahrenheit - 32.0) * 5/9
  }
}

extension Temperature {
  var inFahrenheit: Double {
    inCelsius * 9/5 + 32.0
  }
}

extension Temperature: CustomStringConvertible {
  public var description: String {
    descriptionInC + " (" + descriptionInF + ")"
  }
  
  public var descriptionInC: String {
    "\(int(from: inCelsius))º C"
  }
  
  public var descriptionInF: String {
    "\(int(from: inFahrenheit))º F"
  }
  
  private func int(from double: Double) -> Int {
    Int(double.rounded(.toNearestOrEven))
  }
}
