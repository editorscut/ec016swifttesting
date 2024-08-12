import SwiftUI

struct DropButton: View {
  let currentValue = CurrentValue.shared
  
  var body: some View {
    Button {
      currentValue.drop()
    } label: {
      Text("↓")
        .font(.title)
        .foregroundStyle(.red)
    }
    .disabled(currentValue.stackIsEmpty)
  }
}

#Preview {
  DropButton()
}
