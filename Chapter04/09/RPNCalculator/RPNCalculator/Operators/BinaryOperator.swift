enum BinaryOperator: String {
  case add = "+"
  case substract = "−"
  case multiply = "×"
  case divide = "÷"
}

extension BinaryOperator: CustomStringConvertible {
  var description: String {
    rawValue
  }
}

extension BinaryOperator {
  var operation: (Double, Double) throws -> Double {
    switch self {
    case .add: {$0 + $1}
    case .substract: {$0 - $1}
    case .multiply: {$0 * $1}
    case .divide: { (dividend, divisor) in
      guard divisor != 0 else {
        throw CalculationError.divideByZero
      }
      return dividend/divisor
    }
    }
  }
}
