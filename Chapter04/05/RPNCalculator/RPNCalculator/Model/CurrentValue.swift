import Observation

@MainActor
@Observable
class CurrentValue {
  static let shared = CurrentValue()
  var displayedValue: String = ""
  private var stack = Stack()
  private(set) var displayingEnteredValue = false
}

extension CurrentValue {
  var stackIsEmpty: Bool {
    stack.isEmpty
  }
  
  func enter() {
    if let double = Double(displayedValue) {
      stack = stack.push(double)
      displayingEnteredValue = true
    }
  }
  
  func clear() {
    stack = stack.clear()
    clearDisplay()
  }
}

extension CurrentValue {
  func record(digit: String) {
    if displayingEnteredValue {
      clearDisplay()
    }
    displayedValue += digit
  }
  
  func decimalPoint() {
    if !containsDecimalPoint {
      displayedValue += "."
    }
  }
  
  var containsDecimalPoint: Bool {
    displayedValue.contains(".")
  }
  
  func clearDisplay() {
    displayedValue = ""
    displayingEnteredValue = false
  }
  
  func drop() {
    if let (value, poppedStack) = try? stack.pop() {
      stack = poppedStack
      displayedValue = String(value)
      displayingEnteredValue = true
    }
  }
}

extension CurrentValue {
  func perform(_ unary: UnaryOperator)  {
    if let double = Double(displayedValue) {
      defer {
        displayingEnteredValue = true
      }
      do {
        let result = try unary.operation(double)
        displayedValue = String(result)
      } catch {
        displayedValue = "Error"
      }
    }
  }
}


