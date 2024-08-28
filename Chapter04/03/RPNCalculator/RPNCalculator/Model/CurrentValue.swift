import Observation

@MainActor
@Observable
class CurrentValue {
  static let shared = CurrentValue()
  var displayedValue: String = ""
  private var stack = Stack()
  private(set) var isDisplayingEnteredValue = false
}

extension CurrentValue {
  var isStackEmpty: Bool {
    stack.isEmpty
  }
  
  func enter() {
    if let double = Double(displayedValue) {
      stack = stack.push(double)
      isDisplayingEnteredValue = true
    }
  }
  
  func clear() {
    stack = stack.clear()
    clearDisplay()
  }
}

extension CurrentValue {
  func record(digit: String) {
    if isDisplayingEnteredValue {
      clearDisplay()
    }
    displayedValue += digit
  }
  
  func decimalPoint() {
    if isDisplayingEnteredValue {
      clearDisplay()
    }
    if !containsDecimalPoint {
      displayedValue += "."
    }
  }
  
  var containsDecimalPoint: Bool {
    displayedValue.contains(".")
  }
  
  func clearDisplay() {
    displayedValue = ""
    isDisplayingEnteredValue = false
  }
  
  func drop() {
    if let (value, poppedStack) = try? stack.pop() {
      stack = poppedStack
      displayedValue = String(value)
      isDisplayingEnteredValue = true
    }
  }
}
