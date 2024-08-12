import SwiftUI

struct UnaryOperatorButton: View {
  let currentValue = CurrentValue.shared
  let unaryOperator: UnaryOperator
  
  init(_ unaryOperator: UnaryOperator) {
    self.unaryOperator = unaryOperator
  }
  
  var body: some View {
    Button {
      currentValue.perform(unaryOperator)
    } label: {
      Text("\(unaryOperator)")
        .font(.title)
        .foregroundStyle(unaryOperator == .plusminus ? .black : .accentColor)
    }
    .disabled(disabled)
  }
}

extension UnaryOperatorButton {
  private var disabled: Bool {
    guard let value
            = Double(currentValue.displayedValue) else {
      return false
    }
    return (value == 0 && unaryOperator == .reciprocal)
        || (value <  0 && unaryOperator == .squareroot)
  }
}

#Preview {
  UnaryOperatorButton(.plusminus)
}
