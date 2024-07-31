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
