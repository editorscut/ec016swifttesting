import SwiftUI

struct DropButton: View {
  var body: some View {
    Button {
      
    } label: {
      Text("↓")
        .font(.title)
        .foregroundStyle(.red)
    }
  }
  
}

#Preview {
  DropButton()
}
