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
}

extension CurrentValue {
  func record(digit: String) {
    displayedValue += digit
  }
}
