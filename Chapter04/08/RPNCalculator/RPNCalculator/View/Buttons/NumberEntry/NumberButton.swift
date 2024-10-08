import SwiftUI

struct NumberButton: View {
  let digit: String
  let currentValue = CurrentValue.shared
  
  init(_ digit: String) {
    self.digit = digit
  }
  
  var body:  some View {
    Button {
      currentValue.record(digit: digit)
    } label: {
      Text(digit)
        .font(.largeTitle)
        .foregroundStyle(Color.black)
    }
  }
}

#Preview {
  NumberButton("3")
}
