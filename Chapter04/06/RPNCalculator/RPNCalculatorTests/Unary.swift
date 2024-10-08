import Testing
@testable import RPNCalculator

@Suite("Unary Operators",
       .tags(.unary))
struct Unary {
  @Test
  func operations() throws {
    #expect(try UnaryOperator.square.operation(5) == 25.0)
    #expect(try UnaryOperator.squareroot.operation(25) == 5.0)
    #expect(try UnaryOperator.reciprocal.operation(5) == 0.2)
    #expect(try UnaryOperator.plusminus.operation(5) == -5)
  }
  
  @Test
  func failingSquareroot() throws {
    #expect(throws: CalculationError.squareRootOfANegative) {
      try UnaryOperator.squareroot.operation(-5)
    }
  }
  
  @Test
  func failingReciprocal() throws {
    #expect(throws: CalculationError.divideByZero) {
      try UnaryOperator.reciprocal.operation(0)
    }
  }
  
  @MainActor
  @Suite("Unary Operations via Display",
         .tags(.unary))
  struct UnaryViaDisplay {
    let current = CurrentValue()
    @Test
    func square() {
      current.displayedValue = "5"
      current.perform(.square)
      #expect(current.displayedValue == "25.0")
      #expect(current.isDisplayingEnteredValue == true)
      current.record(digit: "2")
      #expect(current.displayedValue == "2")
      #expect(current.isStackEmpty == true)
    }
    
    @Test
    func squarerootOfANegative() {
      current.displayedValue = "-5"
      current.perform(.squareroot)
      #expect(current.displayedValue == "Error")
      #expect(current.isDisplayingEnteredValue == true)
      current.record(digit: "2")
      #expect(current.displayedValue == "2")
      #expect(current.isStackEmpty == true)
    }
    
    @Test
    func reciprocalOfZero() {
      current.displayedValue = "0"
      current.perform(.reciprocal)
      #expect(current.displayedValue == "Error")
      #expect(current.isDisplayingEnteredValue == true)
      current.record(digit: "2")
      #expect(current.displayedValue == "2")
      #expect(current.isStackEmpty == true)
    }
  }
}
