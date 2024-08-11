import SwiftUI

struct DecimalPointButton: View {
  let currentValue = CurrentValue.shared
  
  var body: some View {
    Button {
      currentValue.decimalPoint()
    } label: {
      Text(".")
        .font(.largeTitle)
        .foregroundStyle(.black)
    }
    .disabled(currentValue.containsDecimalPoint)
  }
}

#Preview {
  DecimalPointButton()
}
