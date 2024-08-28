import Testing
@testable import RPNCalculator

@Suite("Binary Operators",
       .tags(.binary))
struct Binary {
  
  @Test
  func operations() throws {
    #expect(try BinaryOperator.add.operation(6, 2) == 8)
    #expect(try BinaryOperator.subtract.operation(6, 2) == 4)
    #expect(try BinaryOperator.multiply.operation(6, 2) == 12)
    #expect(try BinaryOperator.divide.operation(6, 2) == 3)
  }
  
  @Test
  func failingDivideByZero() throws {
    #expect(throws: CalculationError.divideByZero) {
      try BinaryOperator.divide.operation(6,0)
    }
  }
  
  @MainActor
  @Suite("Binary Operations via Display",
         .tags(.display))
  struct BinaryViaDisplay {
    let current = CurrentValue()
    
    @Test
    func division() {
      current.displayedValue = "6"
      current.enter()
      current.displayedValue = "3"
      current.perform(.divide)
      #expect(current.displayedValue == "2.0")
      #expect(current.isStackEmpty == false)
      #expect(current.isDisplayingEnteredValue == true)
      current.record(digit: "7")
      #expect(current.displayedValue == "7")
      current.perform(.add)
      #expect(current.displayedValue == "9.0")
    }
        
    @Test
    func failingDivisionBy0() {
      current.displayedValue = "6"
      current.enter()
      current.displayedValue = "0"
      current.perform(.divide)
      #expect(current.displayedValue == "Error")
      #expect(current.isStackEmpty == false)
      #expect(current.isDisplayingEnteredValue == true)
      current.record(digit: "7")
      #expect(current.displayedValue == "7")
    }
    
    @Test
    func binaryWithEmptyStackNoOp() {
      current.displayedValue = "6"
      current.perform(.divide)
      #expect(current.displayedValue == "6")
      #expect(current.isStackEmpty == true)
    }
  }
}
