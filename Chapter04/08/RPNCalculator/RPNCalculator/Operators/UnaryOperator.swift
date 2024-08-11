enum UnaryOperator: String {

  case square = "x²"
  case squareroot = "√x"
  case reciprocal = "1/x"
  case plusminus = "±"
}

extension UnaryOperator: CustomStringConvertible {
  var description: String {
    rawValue
  }
}

extension UnaryOperator {
  var operation: (Double) throws -> Double {
    switch self {
    case .square: {$0 * $0}
    case .squareroot: {input in
      guard input >= 0 else {
        throw CalculationError.squareRootOfANegative
      }
      return input.squareRoot()
    }
    case .reciprocal: {input in
      guard input != 0 else {
        throw CalculationError.divideByZero
      }
      return 1/input
    }
    case .plusminus: {-$0}
    }
  }
}
