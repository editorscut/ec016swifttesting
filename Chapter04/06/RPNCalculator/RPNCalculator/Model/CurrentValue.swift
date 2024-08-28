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

extension CurrentValue {
  func perform(_ unary: UnaryOperator)  {
    if let double = Double(displayedValue) {
      defer {
        isDisplayingEnteredValue = true
      }
      do {
        let result = try unary.operation(double)
        displayedValue = String(result)
      } catch {
        displayedValue = "Error"
      }
    }
  }
  
  func perform(_ binary: BinaryOperator)  {
    if let secondArgument = Double(displayedValue),
       let (firstArgument, poppedStack) = try? stack.pop() {
      do {
        let result
        = try binary.operation(firstArgument, secondArgument)
        displayedValue = String(result)
        stack = poppedStack
        enter()
      } catch {
        displayedValue = "Error"
        isDisplayingEnteredValue = true
      }
    }
  }
}


