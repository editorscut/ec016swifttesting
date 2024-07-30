import SwiftUI

struct ClearEntryButton: View {
  var body: some View {
    Button {
      
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
