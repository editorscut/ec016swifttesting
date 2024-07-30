import SwiftUI

struct NumberButton: View {
  let digit: String
  
  init(_ digit: String) {
    self.digit = digit
  }
  
  var body:  some View {
    Button {
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
