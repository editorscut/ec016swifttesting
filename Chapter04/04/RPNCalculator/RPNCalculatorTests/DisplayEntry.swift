import Testing
@testable import RPNCalculator

@Suite("Display Entry",
       .tags(.display),
       .serialized)
struct DisplayEntry {
  @Suite("Number Entry",
         .tags(.numberEntry))
  @MainActor
  struct NumberEntry {
    let current = CurrentValue.shared
    
    @Test("Display is initially empty")
    func emptyDisplay() {
      current.clear()
      #expect(current.displayedValue.isEmpty == true)
    }
    
    @Test("Press 2 Display contains 2")
    func recordTwo() {
      current.record(digit: "2")
      #expect(current.displayedValue == "2")
    }
    
    @Test("Then Press 3 Display contains 23")
    func recordThree() {
      current.record(digit: "3")
      #expect(current.displayedValue == "23")
    }
    
    @Test("Then enter")
    func enter() {
      current.enter()
      #expect(current.displayedValue == "23")
      #expect(current.stackIsEmpty == false)
      #expect(current.displayingEnteredValue == true)
    }
    
    @Test("Press 4 after enter display contains 4")
    func recordFour() {
      current.record(digit: "4")
      #expect(current.displayedValue == "4")
      #expect(current.displayingEnteredValue == false)
    }
    
    @Test("Press drop display contains 23")
    func drop() {
      current.drop()
      #expect(current.displayedValue == "23.0")
      #expect(current.displayingEnteredValue == true)
      #expect(current.stackIsEmpty == true)
    }
    
    @Test("Can enter and drop negative")
    func negative() {
      current.displayedValue = "-7.8"
      current.enter()
      current.drop()
      #expect(current.displayedValue == "-7.8")
    }
  }
  @MainActor
  @Suite("Decimal Point",
         .tags(.decimalPoint))
  struct DecimalPoint {
    let current = CurrentValue.shared
    
    @Test("Display is 23")
    func record23() {
      current.clear()
      current.displayedValue = "23"
      #expect(current.displayedValue == "23")
      #expect(current.stackIsEmpty == true)
    }
    
    @Test("Point and 4 makes it 23.4")
    func recordFour() {
      current.decimalPoint()
      #expect(current.displayedValue == "23.")
      current.record(digit: "4")
      #expect(current.displayedValue == "23.4")
    }
    
    @Test("No to another decimal point")
    func anotherDecimal() {
      current.decimalPoint()
      #expect(current.displayedValue == "23.4")
      current.record(digit: "5")
      #expect(current.displayedValue == "23.45")
    }
    
    @Test("Initial decimal point")
    func initialDecimal() {
      current.clearDisplay()
      current.displayedValue = ".78"
      current.enter()
      current.drop()
      #expect(current.displayedValue == "0.78")
    }
    
    @Test("Initial decimal point after entering decimal")
    func initialDecimalAgain() {
      current.clearDisplay()
      current.displayedValue = ".2"
      current.enter()
      current.decimalPoint()
      current.record(digit: "3")
      #expect(current.displayedValue == ".3")
    }
  }
}
