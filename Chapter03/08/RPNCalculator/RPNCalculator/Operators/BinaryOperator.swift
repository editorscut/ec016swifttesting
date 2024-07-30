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
