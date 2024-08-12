import SwiftUI

struct ClearEntryButton: View {
  let currentValue = CurrentValue.shared
  
  var body: some View {
    Button {
      currentValue.clearDisplay()
    } label: {
      Text("CE")
        .font(.title)
        .foregroundStyle(.red)
    }
  }
}

#Preview {
  ClearEntryButton()
}
