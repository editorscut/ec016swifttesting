enum BinaryOperator: String {
  case add = "+"
  case subtract = "−"
  case multiply = "×"
  case divide = "÷"
}

extension BinaryOperator: CustomStringConvertible {
  var description: String {
    rawValue
  }
}
