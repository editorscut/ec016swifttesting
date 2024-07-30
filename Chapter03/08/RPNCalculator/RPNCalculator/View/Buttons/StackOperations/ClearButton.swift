import SwiftUI

struct ClearButton: View {
  var body: some View {
    Button {
      
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
