import Testing
@testable import RPNCalculator

@Suite("Parametrized test examples")
struct Bonus {
  static let additiveOps: [BinaryOperator] = [.add, .substract]
  static let multiplicativeOps: [BinaryOperator] = [.multiply, .divide]
  static let samples: [Double] = [5, 0, -7]
  static let randomSamples: [Double]  = {
    var doubles: [Double] = []
    for _ in 0...3 {
      doubles.append(Double.random(in: -10...10))
    }
    return doubles
  }()
  
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
