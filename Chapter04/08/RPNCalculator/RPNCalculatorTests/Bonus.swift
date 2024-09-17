import Testing
@testable import RPNCalculator

@Suite("Parameterized test examples")
struct Bonus {
  static let additiveOps: [BinaryOperator] = [.add, .subtract]
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
  
  @Test(arguments: commutativeOps,
        Array(zip(randomSamples, randomSamples.reversed())))
  func commutative(op: BinaryOperator,
                   pair : (Double, Double)) throws {
    let (x, y) = pair
    let xThenY = try op.operation(x, y)
    let yThenX = try op.operation(y, x)
    #expect(xThenY == yThenX)
  }

  @Test(arguments: additiveOps, samples + randomSamples)
  func additiveIdentity(op: BinaryOperator,
                        x: Double) throws {
    #expect(try op.operation(x, 0) == x)
  }
  
  @Test(arguments: multiplicativeOps, samples + randomSamples)
  func multiplicativeIdentity(op: BinaryOperator,
                        x: Double) throws {
    #expect(try op.operation(x, 1) == x)
  }
}

