import Testing
@testable import RPNCalculator

@Suite("Parametrized test examples")
struct Bonus {
  static let additiveOps: [BinaryOperator] = [.add, .substract]
  static let multiplicativeOps: [BinaryOperator] = [.multiply, .divide]
  static let commutativeOps: [BinaryOperator] = [.add, .multiply]
  static let samples: [Double] = [5, 0, -7]
  static let randomSamples: [Double]  = {
    var doubles: [Double] = []
    for _ in 0...3 {
      doubles.append(Double.random(in: -10...10))
    }
    return doubles
  }()
  
  @Test(arguments: commutativeOps, pairUp(randomSamples))
  func commutative(op: BinaryOperator,
                   pair : Pair) throws {
    let xThenY = try op.operation(pair.x, pair.y)
    let yThenX = try op.operation(pair.y, pair.x)
    #expect(xThenY == yThenX)
  }

  @Test(arguments: additiveOps, wrap(samples + randomSamples))
  func additiveIdentity(op: BinaryOperator,
                        value: Single) throws {
    #expect(try op.operation(value.x, 0) == value.x)
  }
  
  @Test(arguments: multiplicativeOps, wrap(samples + randomSamples))
  func multiplicativeIdentity(op: BinaryOperator,
                        value: Single) throws {
    #expect(try op.operation(value.x, 1) == value.x)
  }
}


struct Pair {
  let x: Double
  let y: Double
}

extension Pair: CustomTestStringConvertible {
  var testDescription: String {
    "(" + format(x) + ", " + format(y) + ")"
  }
}


func pairUp(_ doubles: [Double]) -> [Pair] {
   Array(zip(doubles, doubles.reversed())).map { (x, y) in
     Pair(x: x, y: y)
  }
}

struct Single {
  let x: Double
}

extension Single: CustomTestStringConvertible {
  var testDescription: String {
    format(x)
  }
}

func wrap(_ doubles: [Double]) -> [Single] {
  doubles.map { Single(x: $0)}
}

func format(_ number: Double) -> String {
  ((number * 100).rounded(.down) / 100).description
}

  
