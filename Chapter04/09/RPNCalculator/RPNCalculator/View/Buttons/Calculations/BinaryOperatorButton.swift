import SwiftUI

struct BinaryOperatorButton: View {
  let currentValue = CurrentValue.shared
  let binaryOperator: BinaryOperator
  
  init(_ binaryOperator: BinaryOperator) {
    self.binaryOperator = binaryOperator
  }
  
  var body: some View {
    Button {
      currentValue.perform(binaryOperator)
    } label: {
      Text("\(binaryOperator)")
        .font(.title)
    }
    .disabled(disabled)
  }
}

extension BinaryOperatorButton {
  private var disabled: Bool {
    guard let value
            = Double(currentValue.displayedValue) else {
      return false
    }
    return binaryOperator == .divide && value == 0
  }
}

#Preview {
  BinaryOperatorButton(.divide)
}
