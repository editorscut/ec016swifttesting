import SwiftUI

struct ClearButton: View {
  let currentValue = CurrentValue.shared
  
  var body: some View {
    Button {
      currentValue.clear()
    } label: {
      Text("C")
        .font(.title)
        .foregroundStyle(.red)
    }
  }
}

#Preview {
  ClearButton()
}
